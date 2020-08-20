% Uses Britto-Martins' technique (Hilbert followed by  Levenberg-Marquadt) to find best fit for a stepped signal
% Allen Goldstein, NIST, 2020.  no copyright, free to use with this header.
function [Synx,Freq,ROCOF] = StepFit (...
    SignalParams, ...
    DelayCorr, ...
    MagCorr, ...
    F0, ...
    AnalysisCycles, ...
    SampleRate, ...
    Samples ...
    )





%% Initial Signal Parameters

%  Note that the labeling convention comes mostly from the PMU standard
Xm = SignalParams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
Fin = SignalParams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
Ps = SignalParams(3,:);     % phase
%Fh = SignalParams(4,:);     % Frequency of the interfering signal
%Ph = SignalParams(5,:);     % Phase of the interfering signal
%Kh = SignalParams(6,:);     % index of the interfering signal
%Fa = SignalParams(7,:);     % phase (angle) moduation frequency
%Ka = SignalParams(8,:);     % phase (angle) moduation index
%Fx = SignalParams(9,:);     % amplitude moduation frequency
%Kx = SignalParams(10,:);     % amplitude moduation index
%Rf = SignalParams(11,:);     % ROCOF
KaS = SignalParams(12,:);   % phase (angle) step index
KxS = SignalParams(13,:);   % magnitude step index

% Samples are rows of phases and columns of samples (unfortunate but this
% is the way the calibrator was designed)

%% initial guess for step location tau
ignore = 5;     %percent of the beginning and end of the gradient of hilbert to ignore
[tau, freq] = StepLocate(SampleRate,Samples,ignore);

%% Levenburg-Marquadt Curve Fit
Ydim = size(Samples);
NPhases = Ydim(1);
N = Ydim(2);
x = (-(N/2):(N/2)-1)/SampleRate;     % time vector centered on the window
w = 2*pi*Fin;

opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Algorithm = 'Levenberg-Marquardt';
opts.Display = 'Off';
opts.DiffMinChange = 1.18e-12;
opts.Robust='LAR';

Synx=NaN(1,NPhases);
Freq=ones(1,NPhases);
Freq = Freq(1,:).*freq';
ROCOF = zeros(1,NPhases);

for i = 1:NPhases
    
    sw = num2str(w(i));    % frequency
    
    % steps can be phase or amplitude, (have not done any research yet on
    % combined steps)
    if isnan(tau(i))
        % no step was found in the data,
        [Synx,Freq,ROCOF] = SteadyStateFit ( ...
            SignalParams, ...
            DelayCorr, ...
            MagCorr, ...
            F0, ...
            AnalysisCycles, ...
            SampleRate, ...
            Samples ...
            );
        return
    else
        Freq = Fin;     % steplocate is not very good at finding the frequency
        ROCOF = 0; 
        if ~(KxS(i) == 0)      % phase step
            sKxS = num2str(KxS(i));
            f = strcat('a*(1+(x>=b)*',sKxS,')*cos(',sw,'*x+c)');
            opts.StartPoint = [1 tau(i) Ps(i)*pi/180];
        else
            sKaS = num2str(KaS(i)*pi/180);
            f = strcat('a*cos(',sw,'*x+(x>=b)*',sKaS,'+c)');
            opts.StartPoint = [1 tau(i) Ps(i)*pi/180];
        end
    end
    
    ft = fittype(f,'independent','x','dependent','y');
    
    % Fit model to data.
    [xData, yData] = prepareCurveData(x,Samples(i,:));
    
    %use the below for calibration and comment out the visualizatons
    fitresult{i} = fit( xData, yData, ft, opts );
       
%%-----------------------Visualization-------------------------------------   
%     % use the below for research and visualization and comment out the
%     % line above
%     [fitresult{i}, gof(i), output{i}] = fit( xData, yData, ft, opts );
%     
% 
%     if isnan(tau(i))
%         msg=sprintf('Phase %d:, RSquare=%e, rmse=%e',...
%             i,gof(i).rsquare,gof(i).rmse);
%     else
%         msg=sprintf('Phase %d: LocateTau=%e, FitTau=%e, RSquare=%e, rmse=%e',...
%             i,tau(i),fitresult{i}.b,gof(i).rsquare,gof(i).rmse);        
%     end
%     disp(msg);
%     
%     figure(i)
%     %sgtitle(sprintf('Phase%d ',i)) does not work for Matlab 2015
%     subplot(2,1,1)
%     plot(fitresult{i},x,Samples(i,:))
%     subplot(2,1,2)
%     plot(x,20*real(log10(output{i}.residuals(:,1))))
%--------------------------------------------------------------------------    

%% calculate the synchrophasor at the window center, frequency and ROCOF 
    if isnan(tau(i))
       a=fitresult{i}.a*MagCorr(i)/sqrt(2);     % Magnitude corrected
       c=fitresult{i}.c+DelayCorr(i)*1e-9*2*pi*Fin(i);   % Delay Corrected
       Synx(i)=a*exp(-1i*c);
    else
        a=fitresult{i}.a*MagCorr(i)/sqrt(2);     % Magnitude corrected;
        b=fitresult{i}.b;
        c=fitresult{i}.c+DelayCorr(i)*1e-9*2*pi*Fin(i);   % Delay Corrected;
        Synx(i)=a*(1+(b<=0)*KxS(i))*exp(-1i*(c+(b<=0)*KaS(i)));
    end
    
    
 
end
    
   %Calculating symmetrical components if there are enough phases
   if (NPhases > 2)
       alfa = exp(2*pi*1i/3);
       Ai = (1/3)*[1 1 1; 1 alfa alfa^2; 1 alfa^2 alfa];
       
       Vabc = Synx(1:3)';
       Vzpn = Ai*Vabc; %voltage: zero, positive and negative sequence
       V = [Vabc.' Vzpn(2)];
       
       if (NPhases > 5)
           Iabc = Synx(4:6)';
           Izpn = Ai*Iabc; %curren: zero, positive and negative sequence
           V = [V Iabc.' Izpn(2)];
           
           %Calculate the frequency as the mean gradient of the phase of the
           %voltage positive sequence
       end
       Synx=V;
   end
   
 %%------------------------- Debugging display---------------------------
 % Comment out when not debugging
%     mags = abs(Synx);
%     msg =sprintf('mags %f, ',mags);
%     disp(msg)
 %-----------------------------------------------------------------------
end
