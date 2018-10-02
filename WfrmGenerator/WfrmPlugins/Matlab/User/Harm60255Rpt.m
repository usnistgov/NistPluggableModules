function [timestamp,synx,freq,ROCOF] = Harm60255Rpt( ...
    T0, ...
    F0, ...
    time, ...
    signalparams ...
)

% This is the .m file for the C37.118.1 theoretical signal event for the event
% module.  SigalParams description can be found in Event Parameters.docx.

% For this event, there may be multiple phases that can each be independent of the
% others (giving the ability to create unbalanced signals).  In the
% signalparms array, there is one column of parameters for each of
% the phases.

% Signal params.  Note that the labeling convention comes mostly from the
% standard
    Xm = signalparams(1,:);     % phase amplitude
    Fin = signalparams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
    Ps = signalparams(3,:);     % phase 
    nh = signalparams(4,:);     % Frequency of the interfering signal
    nhp = signalparams(5,:);     % Phase of the interfering signal
    
% Phase in radians
Ph = Ps*pi/180;
    
% precalculate the angular frequencies
W0 = 2*pi*F0;     % Nominal angular frequency
Win = 2*pi*Fin;    % Input fundamental angular frequency

% Amplitude, AM and magnitude step
Ain = zeros(length(Xm),length(time));
for i = 1:length(Xm)
    Ain(i,:) = Xm(i);
end

% Phase
for i = 1:length(Ps)
    Theta(i,:) = (W0*time) ...                   % Nominal
                 - ( ...                 
                    (Win(i)*time) ...               % Fundamental
                    + Ph(i) ...    
                  );
end
 
% Synchrophasors
synx = (Ain.*exp(-1i.*Theta)).';

%Frequency, ROCOF
freq = zeros(length(time),1);
ROCOF = freq;
for i = 1:length(Win)
freq(:) = (Win(i) ...                              % Fundamental 
        )/(2*pi);                                  % Hz/Radians
 
 ROCOF(:) = ( ...
            0 ...
         )/(2*pi);                                  % Hz / Radians
end

%Timestamp
timestamp = time + T0;
end

