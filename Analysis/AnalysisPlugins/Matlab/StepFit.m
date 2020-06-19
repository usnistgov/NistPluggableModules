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

Synx=0;Freq=0;ROCOF=0;
%% initial guess for step location tau
ignore = 5;     %percent of the beginning and end of the gradient of hilbert to ignore
tau = StepLocate(SampleRate,Samples,ignore);

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

Synx=NaN(1,NPhases);Freq=Synx;ROCOF=Synx;

for i = 1:NPhases
    
    sw = num2str(w(i));    % frequency
    
    % steps can be phase or amplitude, (have not done any research yet on
    % combined steps)
    if ~(KxS(i) == 0)      % phase step
        sKxS = num2str(KxS(i));
        f = strcat('a*(1+(x>=b)*',sKxS,')*cos(',sw,'*x+c)');
        opts.StartPoint = [1 tau(i) Ps(i)*pi/180];
    else
        sKaS = num2str(KaS(i)*pi/180);
        f = strcat('a*cos(',sw,'*x+(x>=b)*',sKaS,'+c)');
        opts.StartPoint = [1 tau(i) Ps(i)*pi/180];
    end
    
    ft = fittype(f,'independent','x','dependent','y');
    
    % Fit model to data.
    [xData, yData] = prepareCurveData(x,Samples(i,:));
    
    %use the below for calibration and comment out the visualizatons
    % fitresult{i} = ( xData, yData, ft, opts );
       
%%-----------------------Visualization-------------------------------------   
    % use the below for research and visualization
    [fitresult{i}, gof(i), output{i}] = fit( xData, yData, ft, opts );
    
    msg=sprintf('Phase %d: LocateTau=%e, FitTau=%e, RSquare=%e, rmse=%e',...
                i,tau(i),fitresult{i}.b,gof(i).rsquare,gof(i).rmse);
    disp(msg);
    
    figure(i)
    sgtitle(sprintf('Phase%d ',i))
    subplot(2,1,1)
    plot(fitresult{i},x,Samples(i,:))
    subplot(2,1,2)
    plot(x,20*real(log10(output{i}.residuals(:,1))))
%--------------------------------------------------------------------------    

%% calculate the synchrophasor at the window center, frequency and ROCOF 
    a=fitresult{i}.a;b=fitresult{i}.b;c=fitresult{i}.c;
    Synx(i)=a*(1+(b>=0)*KxS(i))*exp(-1i*(c+(b>=0)*KaS(i)));
    Freq(i)= w(i)*180/pi;
    ROCOF(i) = 0;
end

end
