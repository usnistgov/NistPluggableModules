% Experimental sandbox for chirp fitting functions
% Allen Goldstein, NIST, 2020.  no copyright, free to use with this header.
function [Synx,Freq,ROCOF] = ChirpFit (...
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
Rf = SignalParams(11,:);     % ROCOF
%KaS = SignalParams(12,:);   % phase (angle) step index
%KxS = SignalParams(13,:);   % magnitude step index

% Samples are rows of phases and columns of samples (unfortunate but this
% is the way the calibrator was designed)

%% initial guess for step location tau
ignore = 5;     %percent of the beginning and end of the gradient of hilbert to ignore
[tau, freq] = ChirpStepLocate(SampleRate,Samples,ignore);


end