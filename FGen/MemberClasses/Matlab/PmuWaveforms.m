% Generates multi=phase test signals for 60255.118.1 PMU testing
function [Signal,size] = PmuWaveforms( ...
    t0, ...
    SettlingTime, ...
    sizeMax, ...
    FSamp, ...
    signalparams ...
    )


% For this signal, there may be multiple phases that can each be independent of the
% others (giving the ability to create unbalanced signals).  In the
% signalparms array, there is one column of parameters for each of
% the phases.


% t0 is an offset in seconds to the time vector.  For example, during a phase or 
% amplitude step, the step will occur at t = 0 so T0 may be set to -2 seconds.  
% The signal is phase shifted such that cos 0 occures after the initial settling time 
%
% SettlingTime in seconds will be applied to the beginning and end of the signal.  
% At the beginning it starts at negative time and the signal is phase shifted 
% such that cos 0 plus any phase shift occures at t = 0.  At the end it continues for SettlingTime.
%
% sizeMax:  in samples.  If SettlingTime = 0 and the signal is not a step, this produces the smallest signal (up to sizeMax) (in samples) that will allow a continuous reproduction without a discontinuity.  For stepsadn signals with settlingtime, the signal between the end of the initial and start of the final SettlingTime will be sizeMax samples long.


% signalparams  (Note that the labeling convention comes mostly from the standard)
    Xm = signalparams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
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
    KaS = signalparams(12,:);   % phase (angle) step index
    KxS = signalparams(13,:);   % magnitude step index
    

%%    
size = sizeMax;    

% If SettlingTime <= 0, and this is not a step test or ramp, then determine the
% sample size that gives an interger number of periods of the "combined"
% frequency of the fundamental and any added intefering frequency or 
% modulation that may be added. 

if (SettlingTime <= 0 || (KaS(1) ~= 0 && KxS(1) ~= 0) || Rf(1) == 0);
    Freqs = [Fin(1,1)];
    if Kh(1) > 0; Freqs(2) =  Fh(1,1); end
    size = SizeLcmPeriods(Freqs, FSamp);
    if size > sizeMax; size = sizeMax; end
end
    
% Phase in radians
Ph = Ps*pi/180;
    
% calculate the angular frequencies
Wf = 2*pi*Fin;  % fundamental frequency
Wa = 2*pi*Fa;   % phase (angle) modulation frequency
Wx = 2*pi*Fx;   % amplitude modulation frequency
Wh = 2*pi*Fh;

% create the time array.  Add the settling time to both ends of the size
t = t0-SettlingTime:1/FSamp:((size-1)/FSamp)+t0+SettlingTime;

% Amplitude, AM and magnitude step
Ain = zeros(length(Xm),length(t));
for i = 1:length(Xm)
    Ain(i,:) = Xm(i) *(1+Kx(i)*cos((Wx(i)*t)));
    % Amplitude Step: applied after time passes 0
    Ain(i,t >= 0) = Ain(i,t >= 0) * (1 + KxS(i));
end

% Phase
Theta = zeros(length(Ps),length(t));
for i = 1:length(Ps)
    Theta(i,:) = (Wf(i)*t) ...                         % Fundamental
                 + Ph(i) ...               % phase shift
                 - ( ...                 
                    (Ka(i)*cos((Wa(i)*t)-pi)) ...     % Phase modulation
                  );
end

% Phase Step
if KaS(1) ~= 0;
    for i = 1:length(KaS)
        Theta(i,t >= 0) = Theta(i,t >= 0) + (KaS(i) * pi/180);
    end
end

% % frequency ramp
% if Rf(1) ~= 0;
%     for i = 1:length(Rf)
%         Theta(i,t>=0 & t<SettlingTime) = Theta(i,t>=0 & t<SettlingTime) + (Rf(i) * 2 *pi * t(t>=0 & t<SettlingTime).^2);
%     end
%     
%     % % last frequency hold for settling time
%     for i = 1:length(Rf)
%         Theta(i,t>=SettlingTime) = Theta(i,t>=SettlingTime) + (2*pi*Rf(i)*SettlingTime*t(t>=SettlingTime));
%     end
% end

% frequency ramp
for i = 1:length(Rf)
    if Rf(i)~=0
        endRamp = (size/FSamp)+t0;
        Theta(i,t>=0 & t<=endRamp) = Theta(i,t>=0 & t<=endRamp) + (pi*Rf(i)*t(t>=0 & t<=endRamp).^2);
        Theta(i,t>endRamp) = Theta(i,t>endRamp) + 2*(pi*Rf(i)*endRamp*t(t>endRamp));
        %Theta(i,t>=0 & t<endRamp) = Theta(i,t>=0 & t<endRamp) + (pi*Rf(i)*t(t>=0 & t<endRamp).^2);
        %Theta(i,t>=endRamp) = Theta(i,t>=endRamp) + 2*(pi*Rf(i)*endRamp*t(t>=endRamp));
        
    end
end

% Complex signals
 cSignal = (Ain.*exp(-1i.*Theta));
 
%-------------------------debug: frequency plot--------------------------
% Theta = unwrap(angle(cSignal(1,:)));
% Freq = -(diff(Theta).*FSamp/(2*pi));
% plot(t(1:end-1),Freq);
%-------------------------------------------------------------------------
% Add a single harmonic or interharmonic
if (Fh > FSamp/2)
    error('Interfering signal frequency is above FGen Nyquist frequency.  Can not generate');
end % if

for i = 1:length(Wh)
    ThetaH(i,:) = (Wh(i)*t) + Ph(i)*(pi/180);
    cSignal(i,:) = cSignal(i,:) + ((Kh(i) * (sqrt(2)*Xm(i))) * (cos(ThetaH(i,:)) + 1i*sin(ThetaH(i,:))));
end

Signal = real(cSignal);


%%-------------DEBUGGING-------------------------------------------------
% In the step test, I learned from the below that unwrapping is needed when determining frequency!
% 
% fig = 0;
% 
% fig = fig+1;
% figure(fig)
% 
% plot(real(cSignal(1,:)));
% hold on
% plot(imag(cSignal(1,:)));
% hold off
% 
% Pi = angle(cSignal);
% Pi = unwrap(Pi')';
% fig=fig+1;
% figure(fig)
% plot(Pi(1,:));
% 
% 
% fig=fig+1;
% figure(fig)
% 
% Fi = (-diff(Pi')*FSamp/(2*pi))';
% 
% plot(Fi(1,:));
%%------------------------------------------------------------------------

end  %function

