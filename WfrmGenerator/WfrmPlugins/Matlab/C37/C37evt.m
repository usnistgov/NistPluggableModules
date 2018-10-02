function [timestamp,synx,freq,ROCOF] = C37evt( ...
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
    Fh = signalparams(4,:);     % Frequency of the interfering signal
    Ph = signalparams(5,:);     % Phase of the interfering signal
    Kh = signalparams(6,:);     % index of the interfering signal    
    Fa = signalparams(7,:);     % phase (angle) moduation frequency
    Ka = signalparams(8,:);     % phase (angle) moduation index
    Fx = signalparams(9,:);     % amplitude moduation frequency
    Kx = signalparams(10,:);     % amplitude moduation index
    Rf = signalparams(11,:);     % ROCOF
    KaS = signalparams(12,:);   % magnitude step index
    KxS = signalparams(13,:);   % phase (angle) step index
    
% Phase in radians
Ph = Ps*pi/180;
    
% precalculate the angular frequencies
W0 = 2*pi*F0;     % Nominal angular frequency
Win = 2*pi*Fin;    % Input fundamental angular frequency
Wa = 2*pi*Fa;      % PM angular frequency
Wx = 2*pi*Fx;      % AM angular frequency

% Amplitude, AM and magnitude step
for i = 1:length(Xm)
    Ain(i,:) = Xm(i) *(1+(Kx(i)*cos((Wx(i)*time)+Ph(i))));
    % Amplitude Step: applied after time passes 0
    Ain(i,time >= 0) = Ain(i,time >= 0) * (1 + KxS(i));
end

% Phase
for i = 1:length(Ps)
    Theta(i,:) = (W0*time) ...                   % Nominal
                 - ( ...                 
                    (Win(i)*time) ...               % Fundamental
                    + Ph(i) ...    
                    - (Ka(i).*cos((Wa(i)*time)+Ph(i))) ...  % Phase modulation
                    + (Rf(i) * pi * time.^2) ...        % frequency ramp
                  );
end
 
% Phase Step
for i = 1:length(KaS)
    Theta(i,time >= 0) = Theta(i,time >= 0) - (KaS(i) * pi/180);
end

% Synchrophasors
synx = (Ain.*exp(-1i.*Theta)).';

%Frequency, ROCOF
for i = 1:length(Win)
freq = (Win(i) ...                              % Fundamental 
     - (-(Ka(i)/(2*pi))*Wa(i))*sin(Wa(i).*time) ...      % Phase modulation
     + (Rf(i)*2*pi.*time) ...                   % Frequency Ramp
     )/(2*pi);                                  % Hz/Radians
 
 ROCOF = ( ...
            (Rf(i)*Wa(i)^2)*cos(Wa(i).*time) ...    % Phase modulaton
            + (Rf(i)*(2*pi)) ...                    % Frequency Ramp
         )/(2*pi);                                  % Hz / Radians
end

%Timestamp
timestamp = time + T0;
end

