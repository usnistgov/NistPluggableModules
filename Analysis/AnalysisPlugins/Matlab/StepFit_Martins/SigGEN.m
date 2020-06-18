function Signal = SigGEN(F0,F1,SampleRate,Ps,NCycles,tau1,tau2,SNR, KaS, KxS)
%creates a Signal with an integer number of samples for NCycles, with a
%step starting on tau1 and ending on tau2
% tau1 and tau2 are in [%] of total time

%signal generation
%F0 = 60; %Hz nominal
%F1 = 60; %Hz fundamental
%SampleRate = 4800; %Hz
dt = 1/SampleRate;
%NCycles = 6;
NSamples = floor(NCycles*SampleRate/F0);
n = -NSamples/2:(NSamples/2-1); %discrete time vector
tau_pp1 = tau1; % relative time of step in percent of total time 
tau_pp2 = tau2;

tau_0 = (tau_pp1 - 0.5)*NSamples; %discrete time displacement
tau_02 = (tau_pp2 - 0.5)*NSamples;
n1 = n - tau_0;
n2 = n - tau_02;
t1 = n1*dt; %time vector
t2 = n2*dt;
Vm = 1; %70*sqrt(2);
%Ps = 0; %phase in degrees
% Phase in radians
Ph = Ps*pi/180;
%KaS = 10;   % IEEE Std phase (angle) step index: 10 degrees
%KxS = 0;   % magnitude step index: 0.1 
Wf = 2*pi*F1;  % fundamental frequency

Ain = zeros(length(Vm),length(t1));
% Amplitude Step: applied after time passes 0
i = 1;
Ain(i,:) = Vm(i);
Ain(i,t1 >= 0 & t2<=0) = Ain(i,t1 >= 0 & t2<=0) * (1 + KxS(i));

%Phase step
Theta(i,:) = (Wf(i)*t1) ...                         % Fundamental
                 + Ph(i);               % phase shift
Theta(i,t1 >= 0 & t2<=0) = Theta(i,t1 >= 0 & t2<=0) + (KaS(i) * pi/180);
cSignal = (Ain.*exp(-1i.*Theta));
%SNR = 90; %dB SNR = 20 log_10 Asinal/Aruido => Aruido = Asinal/10^(SNR/20)
%Aruido = Vm/10^(SNR/20);
Signal = VSemulator(real(cSignal),16,SNR);