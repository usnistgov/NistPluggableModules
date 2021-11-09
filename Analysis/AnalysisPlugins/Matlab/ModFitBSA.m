function [Synx,Freqs,ROCOFs, iterations] = ModFitBSA(Fin,Fm,Km,Samples,dT,MagCorr,DelayCorr)
%MODFITBSA Summary of this function goes here
%Fitter for modulated signals with modulation index greater than 0.2
%   Fits to a model with only 2 sidebands
% inputs:
%   Fin: Fundamental frequency
%   Fm: Modulation frequency
%   Km: Modulation Index
%   Samples: Rows of samples, columns of phases
%   dt = Sampling period (1/Sample Rate)
%
% Citation:
%Kyriazis G. A., “Estimating parameters of complex modulated signals from
%prior information about their arbitrary waveform components,” IEEE Trans.
%Instrum. Meas., v. 62, no. 6, pp. 1681-1686, June 2013.
%
% Citation:
% Kyriazis G. A., “A Cartesian method to improve the results and
% save computation time in Bayesian signal analysis,” in Advanced
% Mathematical and Computational Tools in Metrology and Testing X (AMCTM
% X), Series on Advances in Mathematics for Applied Sciences, vol. 86, F.
% Pavese; W. Bremser; A.G. Chunovkina; N. Fischer; A.B. Forbes (eds.),
% World Scientific, 2015, pp. 229-240.

% With additional grid search by Allen Goldstein (NIST) (unpublished)


% for debugging and visualization
verbose = true;
debug = true;
fig = 1;
res = 30;
zp = zeros(res,res);

% Basic configuration
[nSamples,nPhases] = size(Samples);
nHarm = 3;          % the number of harmonics to analyse
iFun = 2*nHarm+1;   % number of orthogonal vectors in the hypothesis


iterMax_BSA = 5000;
epsilon_BSA = 1e-8;
rho_BSA = [0.85, 0.85, 0.85];
grid = 20;      % row length for the initial grid search (increase for higher delta-frequency)
thresh = 1000;  % grid search function value threshold (increase for higher delta-frequency)



% A-priori knowlege about the modulating signal
Delta_Freq = Km.*Fm;
mod_Freq = 2*pi*Fm*dT;       % modulation angular frequency normalized for sample rate
mod_Ampl = Km;               % modulation amplitude
mod_Phase = zeros(1,nPhases); % modulation phase assumed 0, BSA will find this

% Function scope variables
V_norm = [];        % normalized eiganvector of the model
invD_norm = [];     % normalized inverted eiganvalues of the model
sigma = 0;          
% 

% BSA of the modulated signal using results of the NLS of the modulated signal
%
% we need to find a good startpoint:
%   startpt(1) = best guess of the carrier frequency
%   startpt(2) = best guess of the modulation phase (Phi_Gen_Mod)
%   startpt(3) = best guess of Delta Frequency (DeltaF_Gen)
% for the modulated signal, we usually have a pretty good idea
% of the carrier frequency, however, for the modulated signal, the
% final modulating frequency phase and delta frequency, are not the
% same values as those used to generate.

% Observation of the objective function contour shows us that a
% grid of 20 points across 0 to 2 pi and from 0 to 4DF
% will have at least one or two good initial guesses up to DF of about 50.
% This would be 400 function evals if allowed to search all points.
% But we also know that there are no local minima, so once we
% reach a threshold of the objective function, we know our
% start value will be good enough.  Typically we get less than 36 fevals

% look for a difference between zBest and zWorst to stop searching
    funEvals = zeros(1,nPhases);               % count the function evaluations
for phase = 1:nPhases
    startpt(1) = 2*pi*Fin(phase)*dT;   % carrier angular frequency normalized for samplerate
    OMEGA2 = linspace(0,2*pi,grid);
    OMEGA3 = linspace(0,4*2*pi*Delta_Freq(phase)*dT,grid);
    z = zeros(12,10);
    zWorst = f([startpt(1),OMEGA2(1),OMEGA3(1)]);
    zBest = zWorst;
    for k = 1:grid
        for l = 1:grid
            z(k,l) =  f([startpt(1),OMEGA2(k),OMEGA3(l)]);
            if z(k,l) < zBest, zBest = z(k,l); end
            if z(k,l) > zWorst, zWorst = z(k,l);end
            if abs(zWorst-zBest) > thresh,break,end
        end
        if abs(zWorst-zBest) > thresh,break,end
    end
    startpt(2) = OMEGA2(k);
    startpt(3) = OMEGA3(l);

    % verbose status display ----------------------------------------------
    if verbose
        fprintf('Grid Search: Phase start = %e, DF start = %e, funevals = %d\n',startpt(2),startpt(3),funEvals(1))
    end
    
    % debugging contour plots ---------------------------------------------
    if debug
        figure(fig), fig=fig+1;
        dF = 2*pi*Delta_Freq*dT;
        fcontour3([startpt(1),startpt(1);0,2*pi;0,2*dF(phase)],res)
        hold on
        for m = 1:k
            for n = 1:l
                plot3(OMEGA2(m),OMEGA3(n),z(m,n),'.')
            end
        end
        hold off
    end
end

%% ========================================================================
% objective function
    function y = f(x)
        funEvals(phase) = funEvals(phase)+1;
        omega = x;  % [carrier freq, modulation phase, delta_Freq;
        t = double(0:nSamples-1)';   % time vector
        
        % The hypothesis
        GIJ = zeros(nSamples,3);
        GIJ(:,1) = 1;       %DC
        GIJ(:,2) = cos(omega(1)*t+omega(3)/mod_Freq(phase)*sin(mod_Freq(phase)*t+omega(2)));
        GIJ(:,3) = sin(omega(1)*t+omega(3)/mod_Freq(phase)*sin(mod_Freq(phase)*t+omega(2)));
        
        y = -prob(GIJ);
    end

    function stloge = prob(GIJ)
        iNo = double(nSamples(:,phase));
        HIJ = ortho(GIJ);    % orthogonolize the objective function
        nFun = size(HIJ,2);
        hi = zeros(nFun,1);
        h2 = 0;
        for j=1:nFun
            h1 = sum(Samples(:,phase).*HIJ(:,j));
            hi(j)=h1;
        end
        h2 = sum(hi.^2);
        h2bar = h2/nFun;
        
        y2 = sum(Samples(:,phase).^2);
        y2bar = y2/iNo;
        
        qq = 1-h2/y2;
        if qq<=0
            qq = 1e-6;
        end
        
        stloge = log(qq)*(nFun-iNo)/2;
        dif = y2bar-nFun*h2bar/iNo;
        sigma = sqrt(abs(dif)*iNo/(iNo-nFun-2));                
    end

    function HIJ = ortho(GIJ)
            % Orthogonalizes the hypothesis function
             M = GIJ'*GIJ;
             M = (M+M.')/2; % The matlab eig function must recognize the matrix as symetrical
             [V,D_vector] = eig(M,'vector');         % eiganvalues and eiganvectors
             SqrSumCol = sum(V.^2);
             norm = sqrt(SqrSumCol);
             V_norm = V./norm;
             D_vec = sqrt(abs(D_vector));
             D_norm = diag(D_vec);
             invD_norm = inv(D_norm);
             A = GIJ*V_norm;
             HIJ = A*invD_norm;         
    end
%% ========================================================================
% contour plots for debugging
    function fcontour3(omega,resolution)
            % plots a 3D contour map of the objective function obj.f(x)
            % fcontour3(omega,fun, res) 
            %
            %   omega:  
            % an N x 2 matrix with N dimensions and the columns being the begin and
            % end points for each dimension.  All dimensions except 2 of
            % them must be the same begin and end point.
            %
            %   res:
            % The number f points to plot in the x and y axis.  The Z axis
            % will have resolution^2 points           
            % 
            %   fun:
            % Handle to the objective function 
            % Create vectors of omega values to check.  Also x and y will be the
            % values to be plotted
            colOMEGA = size(omega,1);
            x = []; y = [];
            OMEGA = [];
            for ip = 1 : colOMEGA
                OMEGA = horzcat(OMEGA,linspace(omega(ip,1),omega(ip,2),resolution)');
                if omega(ip,1)~=omega(ip,2)
                    if isempty(x)
                        x = OMEGA(:,ip);
                        if ip==1,xLbl='Carrier Freq (Hz)';else,xLbl='Phase (rad)';end
                    else
                        y = OMEGA(:,ip);
                        if ip==2,yLbl='Phase (rad)';else,yLbl='Delta Freq (Hz/s)';end                        
                    end
                end
            end
            count = 0;
            wb=waitbar(count,'Drawing Contour');
            for ip = 1:resolution
                for jp = 1:resolution
                    zp(ip,jp) = f([OMEGA(ip,1),OMEGA(jp,2),OMEGA(ip,3)]);
                    count = count+1;
                    waitbar(count/resolution^2)
                end
            end
            close(wb)
            contour3(x,y,zp,30,'-k')
            xlabel(xLbl),ylabel(yLbl),zlabel('f eval')                        
    end
%% ========================================================================
    
end