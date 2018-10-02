% Estimation of Sincrophasors with discontinuities
% using MATLAB optimization toolbox 
clear all; close all; clc;

% %These uncertainties can be set to generate random values around the
% variables used for parameters later in the code, if you want
% UF1 = 0.05; %uncertainty of frequency in [%]
% UVm = 1; %uncertainty of magnitude in [%]
% UKa = 1; %uncertainty of Ka in [%]
% UKx = 1; %uncertainty of Kx in [%]
% UPs = 1; %uncertainty of phase in degrees

Pin = 90; %initial phase in degrees  %worst case is 90 degrees

%Here, you choose if it is a magnitude step or phase step
% please dont try to do both.
KaS = 0;   % IEEE Std phase (angle) step index: 10 degrees
KxS = 0.1;   % magnitude step index: 0.1 

% Applying uncertainties in the parameters
KaS = KaS + 0; %you can add something or KaS*2*UKa/100*(rand-0.5);
KxS = KxS + 0;  %you can add something or KxS*2*UKx/100*(rand-0.5);

Vm = 0.9; 
Vm = Vm + 0; %you can add something or %Vm*2*UVm/100*(rand-0.5);

Ps = Pin; %phase in degrees
Ps = Ps + 0; %you can add something or %2*UPs/100*(rand-0.5);
Ps_deg = Ps;

F0 = 60; %Hz  Nominal frequency
F1 = 60; %Hz  Fundamental frequency
F1 = F1 + 0; %if you want, add some different value or  %F1*2*UF1/100*(rand-0.5);

SNR = 75;  %signal noise ratio in dB
rng('shuffle');

%Monte carlo loop was extracted, making k =1 runs only one time
k = 1

%signal generation parameters

SampleRate = 5000; %Hz
dt = 1/SampleRate;
AnalysisCycles = 6;
NSamples = floor(AnalysisCycles*SampleRate/F0);
n = -NSamples/2:(NSamples/2-1); %discrete time vector

%tau_pp means tau in percentage of T, where T is the lenght of the measurement window
tau_pp_set = 0.1:0.1:0.9; % set of relative times of step in percent of total time 
tau_pp = tau_pp_set(5);  %Choose one from the tau_pp_set or other

%to generate the signal with step, the time vectors are displaced 
% if tau_pp = 0.5, it is centered in n=0
tau_0 = (tau_pp - 0.5)*NSamples; %discrete time displacement
n = n - tau_0;  %relativa time vector in samples
t = n*dt; % relative time vector in seconds


% Phase in radians
Ph = Ps*pi/180;

Wf = 2*pi*F1;  % fundamental frequency

Xm = Vm; %for now, single phase; TODO: 6-channels

%%%%% Signal generation with relative time vectors 

Ain = zeros(length(Xm),length(t));
% Amplitude Step: applied after time passes 0
i = 1;
Ain(i,:) = Xm(i);
Ain(i,t >= 0) = Ain(i,t >= 0) * (1 + KxS(i));
%Phase step
Theta(i,:) = (Wf(i)*t) ...                         % Fundamental
                 + Ph(i);               % phase shift
Theta(i,t >= 0) = Theta(i,t >= 0) + (KaS(i) * pi/180);
cSignal = (Ain.*exp(-1i.*Theta));
rSignal = real(cSignal);
var_noise = ((std(rSignal))/(10^(SNR/20)))^2;
std_noise = (std(rSignal))/(10^(SNR/20));
noise = std_noise*randn(1,length(rSignal));  

    %Finally, the signal
    Signal =  rSignal + noise;
    SNR_hist(k) = snr(Signal,noise); % just for checking the actual SNR
    
    %if you want to check the generated signal:
    plot(t,Signal)
    
    %%%% Estimation of tau
    z=hilbert(Signal');  % calculates the analytic signal associated with Signal
    f=angle(z(2:end,:).*conj(z(1:end-1,:)));  % Hilbert estimate of the instantaneous frequency of z

    % the estimation of instantaneous frequency doesnt work well in the
    % beggining or in the end of the signal, so 5% of NSamples are taken off at the beggining and end
    br = 0.05*NSamples; % number of samples to be taken off
    d=abs(f)-median(f(br:end-br)); %the detection signal gets only the variation of f, taking off the median value
    %Ain = (Ain - mean(Ain))./abs(Ain);
    
   %here we detect the peak of the f variation
    [ifmax, imax] = max(d(br:end-br));

   % now, we get the actual index in Signal (because we took off the first
   % and latter samples, they must be considered)
   
    tau_e = (br + imax - 1)*dt;  %this is tau estimated in seconds
    tau = (tau_0 + NSamples/2)*dt;  %this is actual tau in seconds

    %Finally, the tau error, in seconds
    tau_error(k) = tau_e - tau
    % if you want, tau error in number of dts
    tau_error_dt = tau_error/dt
    
     figure
     nn = 1:(NSamples-1);
     subplot(2,1,1)
     plot(nn,abs(d));
     xlabel('Samples', 'Fontsize',17);ylabel('$\mid{d[n]}\mid$','Interpreter','latex','Fontsize',17)
     subplot(2,1,2)
     plot(t,Signal); xlabel('Relative time [s]', 'Fontsize',17); ylabel('y(t) [V]', 'Fontsize',17)


% without Monte Carlo, there is not histogram

%max_dt = max(tau_error)/dt
%min_dt = min(tau_error)/dt
% hist((tau_error/dt))
% xlabel('\tau error [\Deltat]')
% ylabel('Occurrences')

% figure
% subplot(2,1,1)
% plot(nn,abs(f)); title('Instantaneous frequency (abs)')
% subplot(2,1,2)
% plot(t,Signal); title('Signal with Magnitude Step')