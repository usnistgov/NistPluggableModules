function [Signal] = Harm60255Sig( ...
    t, ...
    FSamp, ...
    signalparams ...
    )

% This is the .m file for the C37.118.1 power system signal for the
% PMUImpairment module.  SignalParams description can be found in Event Parameters.docx.

% For this signal, there may be multiple phases that can each be independent of the
% others (giving the ability to create unbalanced signals).  In the
% signalparms array, there is one column of parameters for each of
% the phases.

% Signal params.  Note that the labeling convention comes mostly from the
% standard
    Xm = signalparams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
    Fin = signalparams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
    Ps = signalparams(3,:);     % phase 
    nh = signalparams(4,:);     % harmonic number
    nhp = signalparams(5,:);    % harmonic phase multiplier
    Kh = signalparams(6,:);     % Harmonic index   
                                    
% Phase in radians
Ph = Ps*pi/180;
    
% calculate the angular frequencies
Wf = 2*pi*Fin;  % fundamental frequency
Wh = 2*pi*nh.*Fin; % harmonic angular frequency

% Amplitude, AM and magnitude step
Ain = zeros(length(Xm),length(t));
for i = 1:length(Xm)
    Ain(i,:) = Xm(i);
end

% Phase
Theta = zeros(length(Ps),length(t));
for i = 1:length(Ps)
    Theta(i,:) = (Wf(i)*t) ...                         % Fundamental
                 + Ph(i) ...                           % phase shift
                 ;
end

% Complex signals
cSignal = (Ain.*exp(-1i.*Theta));

% Add a single harmonic
if (nh.*Fin > FSamp/2)
    error('Harmonic frequency is above PMU Nyquist frequency.  Can not generate');
end % if

for i = 1:length(Wh)
    ThetaH(i,:) = (Wh(i)*t) + nhp(i)*Ph(i);
    cSignal(i,:) = cSignal(i,:) + ((Kh(i) * (sqrt(2)*Xm(i))) * (cos(ThetaH(i,:)) + 1i*sin(ThetaH(i,:))));
end

Signal = real(cSignal);

end  %function

