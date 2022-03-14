function [ Phasors, Freqs, ROCOFs, iter, PhasorsH] = Fit4Param( F, dt, Samples, varargin)
% Fits modulated signals with small modulation index (Km < 0.2) and
% modulation frequency < 1 Hz.
%   Input:
%       wF: row vector of fundamental frequencies (1 per phase)
%       dt: Sampling Period
%       Samples: rows of samples and columns of Phases
%               Note:  At the time of this writing, Labview stores
%               transposed samples
%       varargin: if there are any additional inputs, only the first
%       (varagrin{}) will be read as a vector interharmonic frequencies fi,
%       one for each phase

[nSamples, nPhases] = size(Samples);
% pre-allocate the outputs
Phasors = zeros(1,nPhases);
PhasorsH = zeros(1,nPhases);
Freqs = zeros(1,nPhases);
ROCOFs = zeros(1,nPhases);
iter = zeros(1,nPhases);


Fi = ones(1,nPhases)*-1; %default no interharmonic frequency
if nargin > 3   % check for any varargin
    validateattributes(varargin{1},{'numeric'},{'size',[1,nPhases]})
    Fi = varargin{1};
end


% Set up the regression loop
MaxIter = 40;
FitCrit = 1e-7;
%tn = ((-(nSamples/2 - (1/2)):nSamples/2 - (1/2))*dt)';
tn = (linspace(-(nSamples/2),(nSamples/2)-1,nSamples)*dt)';

for p = 1:nPhases
    w = 2*pi*F(p);
    H = [cos(w*tn), sin(w*tn), ones(nSamples,1)];
    if Fi(p)>0
        wi = 2*pi*Fi(p);
        H = [H cos(wi*tn) sin(wi*tn)];
    end    
    S = (H'*H)\(H'*Samples(:,p));
    A = S(1); B = S(2); % Note DC offset is ignored
    if Fi(p)>0
        C = S(4); D = S(5);
    end
        
    if (abs(complex(A,B))< 5e-3) % check for signals close to 0;
        A = 0; B = 0;
        w = 0;
        dw = 0;
        k = 1;
    else
        
        % regression loop finds the frequency.  This is the classic 4-parameter
        % cosine fit.
        for k = 1:MaxIter
            H = [cos(w*tn), sin(w*tn), ones(nSamples,1)];
            if Fi(p)>0
                H = [H cos(wi*tn) sin(wi*tn)];
            end
            G = [H (-A*tn.*sin(w*tn) + B*tn.*cos(w*tn))];
            S = (G'*G)\(G'*Samples(:,p));
            A = S(1); B = S(2); % Note DC offset is ignored
            if Fi(p)>0
                C = S(4); D = S(5);
            end
            
            dw = S(size(S,1));   % change in frequency is the amplitude of the sine term
            w = w + dw;
            if dw < FitCrit
                break
            end
        end
    end
    
    Phasors(p) = complex(A,B);
    Freqs(p) = w/(2*pi);
    ROCOFs(p) = dw/(2*pi);
    iter(p)=k;
    
    % Harmonics or interharmonics
    if Fi>0
        PhasorsH(p) = complex(C,D);
    end
%     %**********************DEBUGGING*******************************************
%     %residuals
%     bestFit = S'*G';
%     r = Samples(:,p) - bestFit';
%     figure(p)
%     subplot(2,1,1)
%     plot(tn,Samples(:,p),'-b',tn,bestFit,'-g')
%     legend({'Samples','Best Fit'})
%     title('Fit')
%     subplot(2,1,2)
%     plot(tn,r,'-r')
%     title ('Residual')
%     erms(p) = sqrt((1/nSamples)*sum(r.^2));
%     %**********************DEBUGGING*******************************************
    
end % for p = a:nPhases

end % Function

