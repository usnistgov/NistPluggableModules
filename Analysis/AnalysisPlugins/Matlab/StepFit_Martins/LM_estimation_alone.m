% Estimation of Sincrophasors with discontinuities
% using MATLAB optimization toolbox 
clear all; close all; clc;

%Parameters for signal generation
F0 = 60; %Hz
F1 = 60; %Hz
SampleRate = 5000; %Hz
dt = 1/SampleRate;
AnalysisCycles = 6;
NSamples = floor(AnalysisCycles*SampleRate/F0);
n = -NSamples/2:(NSamples/2-1); %discrete time vector

%Nominal parameters, change if you want
Vm = 1; %70*sqrt(2) =~ 100;
Xm = Vm;
Ps = 120; %phase in degrees
Ph = Ps*pi/180;% Phase in radians
KaS = -10;   % IEEE Std phase (angle) step index: 10 degree
% OBS: KaS is used to track whether the test is phase step (KaS ~= 0) or not (KaS == 0) 
KxS = 0;   % magnitude step index: 0.1
Wf = 2*pi*F1;  % fundamental frequency
SNR = 90; %dB SNR = 20 log_10 Asinal/Aruido => Aruido = Asinal/10^(SNR/20)

ti = 3;     % change ti to control the tau parameter: 
            % ex: ti=1 -> tau = 10% of T
            % ex: ti=5 -> tau = 50% of T
            % OBS: the tau parameter is not estimated in this code, you
            % need to give a value for it

    tau_pp = 0.1*ti; % relative time of step in percent of total time 
    tau_0 = (tau_pp - 0.5)*NSamples; %discrete time displacement
    n = -NSamples/2:(NSamples/2-1); %discrete time vector
    n = n - tau_0;
    t = n*dt; %relative time vector
    % note that the relative time vector is displaced by tau

    %%%% Signal parameters estimation
    % Here, u represents a step function
    u = zeros(length(Xm),length(t));
    tau = 0;  % the step happens always when the relative time t=0
    u(length(Xm),t >= tau) = u(length(Xm),t >= tau) + 1;
    
 %%%%%  Defining the Mathematical model functions: f(x)
    % f is a function that represents the mathematical model
    % we infer if the model is phase step from KaS parameter
    % x is a vector that contains the parameters, depending on the case
    % x = [x1,w,phi,x3] for phase step
    % x = [x1,x2,w,phi] for mag step
    % xnom contains the nominal values set in the beggining
    if KaS ~= 0
        % Phase step
        % Model: f(x) = x1*cos(w*t + phi + x3*u(t - tau)) 
        f = @(x) x(1)*cos(x(2)*t + x(3) + 2*pi + x(4)*(pi/180)*u);
        xnom = [Vm 2*pi*F1 Ph KaS];
    else %if not, it is a magnitude step
        % Mag step
        % model: f(x) = x1(1+x2*u(t-tau))*cos(w*t + phi)
        f = @(x) x(1)*(1+x(2)*u).*cos(x(3)*t + x(4));
        xnom = [Vm KxS 2*pi*F1 Ph];
    end
    
    %OBS: From here, I took off the Monte Carlo loops and uncertainties in parameters
    
%%%%%% Generating the Signal %%%%%%%
    % xr is the vector of parameters used to generate the signal, the
    % 'actual' values that the fitting should reach
    % xr can be the nominal values or something slightly different, to
    % simulate the uncertainty in the generation
    xr = xnom;  %xr is fixed - first guess are the nominal values: change if you want
    k = 1;  %it would be the kth Monte Carlo run
 
    %%%%%% Signal parameters %%%%%
            i = 1; Xm = xr(1); 
            if KaS ~= 0
                Wf(i) = xr(2); 
                Ph(i) = xr(3);
                KxS_(i) = 0;
                KaS_(i) = xr(4);
            else
                Ph(i) = xr(4); 
                Wf(i) = xr(3);
                KxS_(i) = xr(2);
                KaS_(i) = 0;
            end
            
       %%%%% Signal generation
            Ain = zeros(length(Xm),length(t));
            % Amplitude Step: applied after time passes 0
            Ain(i,:) = Xm(i);
            Ain(i,t >= 0) = Ain(i,t >= 0) * (1 + KxS_(i));
            %Phase step
            Theta(i,:) = (Wf(i)*t) ...                         % Fundamental
                             + Ph(i);               % phase shift
            Theta(i,t >= 0) = Theta(i,t >= 0) + (KaS_(i) * pi/180);
            cSignal = (Ain.*exp(-1i.*Theta));
            rSignal = real(cSignal);
            
            % noise generation, given a SNR
            var_noise = ((std(rSignal))/(10^(SNR/20)))^2;
            std_noise = (std(rSignal))/(10^(SNR/20));
            noise = std_noise*randn(1,length(rSignal));
            
            Signal = rSignal + noise;
            SNR_hist = snr(Signal,noise);  %just to check the SNR, if you want
            
         %y0: signal generated with the nominal parameters, without noise
         y0 = f(xnom);
         plot(n,Signal,'.b',n,y0,'r')
         legend('Sampled Signal', 'Signal Model')
         
         % in this plot, if we used the nominal parameters to generate Signal, what we see is just the noise
         figure
         plot(n,Signal - y0,'r')
         title('Point by point estimation error: Signal - y')

  %%%%%% Non linear fitting: now we finally get the estimated parameters
        % Levenberg-marquardt from optimization toolbox
        % Define the error function will to be used in the parameter estimation
        % OBS: you don't need to make it err^2 here
        err = @(x) (Signal - f(x));
        x0 = xnom; %x0 is the first guess for the NL fitting
        tol = 1e-7;
        OPTIONS = optimoptions('lsqnonlin', 'Algorithm','levenberg-marquardt','OptimalityTolerance',tol);
        OPTIONS.StepTolerance = 1e-12;
        [X,RESNORM,RESIDUAL,exitflag,output] = lsqnonlin(err,x0,[],[],OPTIONS);
        % X receives the estimated parameters
        % Y is the signal generated with the estimated parameters X:
        Y = f(X);
        
  %%%% After getting the estimated parameters, calculate the phasors and
  %%%% errors
  %%%%% Intermediate phasors calculation
        T = NSamples*dt;
        tau_est = tau_pp + tau/NSamples;  %estimated tau/T (we can simulate errors in tau estimation)
        if KaS ~= 0
            %phase step
            Xe_r = xr(1);   %reference magnitude (actual value xr)
            Xe = X(1);      %estimated magnitude
            Phe_r = xr(3)*tau_pp + (xr(3) + xr(4)*(pi/180))*(1 - tau_pp); %reference phase (actual value xr)
            Phe = X(3)*tau_est + (X(3)+X(4)*(pi/180))*(1 - tau_est);  %estimated phase
        else
            %mag step
            Xe_r = xr(1)*tau_pp + xr(1)*(1+xr(2))*(1 - tau_pp);  %reference magnitude
            Xe = X(1)*tau_est + X(1)*(1+X(2))*(1-tau_est); %estimated magnitude
            Phe_r = xr(4); %reference phase
            Phe = X(4);    %estimated phase
        end
        
    %%% Error calculation
        % Errors for the intermediate phasors
        Phasor_mag_error(k,:) = (Xe - Xe_r)/Xe_r;  %in [V/V]
        Phasor_ph_error(k,:) = (Phe - Phe_r)/Phe_r; %in [rad/rad]
        % all parameters errors, the parameters depend on the model (f)
        errors(k,:) = (xr - X)./xr;

        % Taking the relative errors of each parameter
        if KaS ~= 0
                Wferror(i) = errors(2) 
                Pherror(i) = errors(3)
                KxS_error(i) = 0
                KaS_error(i) = errors(4)
            else
                Pherror(i) = errors(4) 
                Wferror(i) = errors(3)
                KxS_error(i) = errors(2)
                KaS_error(i) = 0
            end
        
        
%  DISABLED the code below, it doesn't make sense without Monte Carlo
%  %%%% Statistics of errors for all parameters
%     ERR_MAX = max(errors)*100';   %max errors in [%]
%     ERR_MIN = min(errors)*100';   %max errors in [%]    
%     MEAN_ERR = mean(errors)*100;  %max errors in [%]
%     STDEV_ERR = std(errors)*100;  %standard deviation in [%]
% 
%     %Intermediate phasor errors [%]
%     Phasor_mag_errmax(ti,1) = max(Phasor_mag_error)*100;
%     Phasor_mag_errmax_abs(ti,1) = max(abs(Phasor_mag_error))*100;
%     Phasor_ph_errmax(ti,1) = max(Phasor_ph_error)*100;
%     Phasor_ph_errmax_abs(ti,1) = max(abs(Phasor_ph_error))*100;
%     Phasor_mag_errmin(ti,1) = min(Phasor_mag_error)*100;
%     Phasor_ph_errmin(ti,1) = min(Phasor_ph_error)*100;
%     Phasor_mag_errmean(ti,1) = mean(Phasor_mag_error)*100;
%     Phasor_ph_errmean(ti,1) = mean(Phasor_ph_error)*100;
%     Phasor_mag_errstdev(ti,1) = std(Phasor_mag_error)*100;
%     Phasor_ph_errstdev(ti,1) = std(Phasor_ph_error)*100;        
%     
%     %X1 magnitude errors in [%]
%     Mag_errmax(ti,1) = ERR_MAX(1);
%     Mag_errmin(ti,1) = ERR_MIN(1);
%     Mag_errmed(ti,1) = MEAN_ERR(1);
%     Mag_stddev(ti,1) = STDEV_ERR(1);
%     Mag_errmax_abs(ti,1) = max(abs([ERR_MAX(1),ERR_MIN(1)]));
%     
%     %Frequency errors in [%]
%     if KaS ~= 0
%         ifreq = 2;
%     else
%         ifreq = 3;
%     end
%     Freq_errmax(ti,1) = ERR_MAX(ifreq);
%     Freq_errmin(ti,1) = ERR_MIN(ifreq);
%     Freq_errmed(ti,1) = MEAN_ERR(ifreq);
%     Freq_stddev(ti,1) = STDEV_ERR(ifreq);
%     Freq_errmax_abs(ti,1) = max(abs([ERR_MAX(ifreq),ERR_MIN(ifreq)]));
%     
%     %Phase errors [%]
%     if KaS ~= 0
%         iph = 3;
%     else
%         iph = 4;
%     end
%     Ph_errmax(ti,1) = ERR_MAX(iph);
%     Ph_errmin(ti,1) = ERR_MIN(iph);
%     Ph_errmed(ti,1) = MEAN_ERR(iph);
%     Ph_stddev(ti,1) = STDEV_ERR(iph);    
%     Ph_errmax_abs(ti,1) = max(abs([ERR_MAX(iph),ERR_MIN(iph)]));
%     
%     %(KxS or KaS) errors in [%]
%     if KaS ~= 0
%         ik = 4;
%     else
%         ik = 2;
%     end
%     K_errmax(ti,1) = ERR_MAX(ik);
%     K_errmin(ti,1) = ERR_MIN(ik);
%     K_errmed(ti,1) = MEAN_ERR(ik);
%     K_stddev(ti,1) = STDEV_ERR(ik);    
%     K_errmax_abs(ti,1) = max(abs([ERR_MAX(ik),ERR_MIN(ik)]));
%     
%     %Freq_err_per_std(ti,1) = ERR_MAX(2)/STDEV_ERR(2);
%     
%  
% 
% beep
