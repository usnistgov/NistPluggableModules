% Estimation of Sincrophasors with discontinuities
% using MATLAB optimization toolbox 
clear all; close all; clc;

%signal generation
F0 = 60; %Hz
F1 = 60; %Hz
SampleRate = 5000; %Hz
dt = 1/SampleRate;
AnalysisCycles = 6;
NSamples = floor(AnalysisCycles*SampleRate/F0);
n = -NSamples/2:(NSamples/2-1); %discrete time vector

Vm = 1; %70*sqrt(2) =~ 100;
Xm = Vm;
Ps = -120; %phase in degrees
Ph = Ps*pi/180;% Phase in radians
KaS = -10;   % IEEE Std phase (angle) step index: 10 degrees
KxS = 0;   % magnitude step index: 0.1 
Wf = 2*pi*F1;  % fundamental frequency
SNR = 90; %dB SNR = 20 log_10 Asinal/Aruido => Aruido = Asinal/10^(SNR/20)
%Aruido = Vm/10^(SNR/20);

for ti = 1:9
    
    tau_pp = 0.1*ti; % relative time of step in percent of total time 
    tau_0 = (tau_pp - 0.5)*NSamples; %discrete time displacement
    n = -NSamples/2:(NSamples/2-1); %discrete time vector
    n = n - tau_0;
    t = n*dt; %time vector

    %%%% Signal parameters estimation
    
    u = zeros(length(Xm),length(t));
    tau = 0;
    u(length(Xm),t >= tau) = u(length(Xm),t >= tau) + 1;
    
    %modelo 1
    % Phase step
    % Model: f(x) = x1*cos(w*t + phi + x2*u(t - tau)) 
    if KaS ~= 0
        %f = @(x) x(1)*cos(x(2)*t + x(3) + x(4)*(pi/180)*u);
        f = @(x) x(1)*cos(x(2)*t + x(3) + 2*pi + x(4)*(pi/180)*u);
        xnom = [Vm 2*pi*F1 Ph KaS];
    else
        %mag
        %f = @(x) x(1)*(1+x(4)*u).*cos(x(2)*t + x(3));
        %xnom1 = [Vm 2*pi*F1 Ph KxS];
        f = @(x) x(1)*(1+x(2)*u).*cos(x(3)*t + x(4));
        xnom = [Vm KxS 2*pi*F1 Ph];
    end
    
    %err = @(x) (Signal - f(x)).^2;
    err = @(x) (Signal - f(x));

    % Nonlinear fit
    % Monte Carlo analysis
    Niter = 1000;
    x0 = xnom;  %x0 is fixed - first guess are the nominal values
    
    for k = 1:Niter
        %first guess
        k
        %uncertainties of parameters in signal generation
        if KaS ~= 0
        % phase         X1  w    ph   x3 (KaS)
            par_var = [1   0.05 1 1]; % parameter variation in percent related to nominal
        else
        % mag          x1  x2(KxS)  wf    ph  
            par_var = [1   1     0.05  1]; % parameter variation in percent related to nominal            
        end

        rng('shuffle');
        rn = (rand(1,length(xnom))-0.5);
        xr = xnom.*(1+2*(par_var/100).*rn);
        freq_rand = xr(3)/(2*pi)
        
        %uncertainties of tau estimation
        utau = 2;  %number of dts 
        u = zeros(length(Xm),length(t));
        tau = dt*randi([-utau utau],1);
        u(length(Xm),t >= tau) = u(length(Xm),t >= tau) + 1;
        
        %regenerates the signal with the uncertainties
            i = 1;
            Xm = xr(1); 
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
            var_noise = ((std(rSignal))/(10^(SNR/20)))^2;
            std_noise = (std(rSignal))/(10^(SNR/20));
            noise = std_noise*randn(1,length(rSignal));
            Signal = rSignal + noise;
            SNR_hist = snr(Signal,noise);
            %err = @(x) (Signal - f(x)).^2;
            err = @(x) (Signal - f(x));
        y0 = f(x0);
        x = xnom;
        %estimated signal
%          y = f(xnom);
%          plot(t,Signal,'.b',t,y,'r')
     
        % figure
        % plot(t,Signal - y0,'r')
        % title('Point by point estimation error: Signal - y')

        % Levenberg-marquardt from optimization toolbox
        tol = 1e-7;
        OPTIONS = optimoptions('lsqnonlin', 'Algorithm','levenberg-marquardt','OptimalityTolerance',tol);
        OPTIONS.StepTolerance = 1e-12;
        [X,RESNORM,RESIDUAL,exitflag,output] = lsqnonlin(err,x0,[],[],OPTIONS);
        Y = f(X);
        
        %Steady State LS fit
        SignalParams(1) = F1; %F1;
        SignalParams(2) = 0;
        SignalParams(3) = 0;
        SignalParams(7) = 0;
        SignalParams(8) = 0;
        DelayCorr = 0; %-3500.0; %   %[in nanosecond]
        MagCorr = 1;
        [Synx(k,:),Freq(k,:),ROCOF(k,:)] = SteadyStateFit ( ...
            SignalParams, ...
            DelayCorr, ...
            MagCorr, ...
            F0, ...
            AnalysisCycles, ...
            SampleRate, ...
            Signal ...
            );
        FE_SS(k) = Wf/(2*pi) - Freq(k);   %[Hz]
        FE_LM(k) = Wf/(2*pi) - X(3)/(2*pi);   %[Hz]
        
        %Intermediate phasor
        T = NSamples*dt;
        tau_est = tau_pp + tau/NSamples;
        if KaS ~= 0
            %phase step
            Xe_r = xr(1);
            Xe = X(1);
            Phe_r = xr(3)*tau_pp + (xr(3) + xr(4)*(pi/180))*(1 - tau_pp);
            Phe = X(3)*tau_est + (X(3)+X(4)*(pi/180))*(1 - tau_est);
        else
            %mag step
            Xe_r = xr(1)*tau_pp + xr(1)*(1+xr(2))*(1 - tau_pp);
            Xe = X(1)*tau_est + X(1)*(1+X(2))*(1-tau_est);
            Phe_r = xr(4);
            Phe = X(4);
        end
        
        Phasor_mag_error(k,:) = (Xe - Xe_r)/Xe_r;
        Phasor_ph_error(k,:) = (Phe - Phe_r)/Phe_r;
        errors(k,:) = (xr - X)./xr;

    end
    
 
    ERR_MAX = max(errors)*100';   %max errors in [%]
    ERR_MIN = min(errors)*100';   %max errors in [%]    
    MEAN_ERR = mean(errors)*100;  %max errors in [%]
    STDEV_ERR = std(errors)*100;  %standard deviation in [%]

    %Intermediate phasor errors [%]
    Phasor_mag_errmax(ti,1) = max(Phasor_mag_error)*100;
    Phasor_mag_errmax_abs(ti,1) = max(abs(Phasor_mag_error))*100;
    Phasor_ph_errmax(ti,1) = max(Phasor_ph_error)*100;
    Phasor_ph_errmax_abs(ti,1) = max(abs(Phasor_ph_error))*100;
    Phasor_mag_errmin(ti,1) = min(Phasor_mag_error)*100;
    Phasor_ph_errmin(ti,1) = min(Phasor_ph_error)*100;
    Phasor_mag_errmean(ti,1) = mean(Phasor_mag_error)*100;
    Phasor_ph_errmean(ti,1) = mean(Phasor_ph_error)*100;
    Phasor_mag_errstdev(ti,1) = std(Phasor_mag_error)*100;
    Phasor_ph_errstdev(ti,1) = std(Phasor_ph_error)*100;        
    
    %X1 magnitude errors in [%]
    Mag_errmax(ti,1) = ERR_MAX(1);
    Mag_errmin(ti,1) = ERR_MIN(1);
    Mag_errmed(ti,1) = MEAN_ERR(1);
    Mag_stddev(ti,1) = STDEV_ERR(1);
    Mag_errmax_abs(ti,1) = max(abs([ERR_MAX(1),ERR_MIN(1)]));
    
    %Frequency errors in [%]
    if KaS ~= 0
        ifreq = 2;
    else
        ifreq = 3;
    end
    Freq_errmax(ti,1) = ERR_MAX(ifreq);
    Freq_errmin(ti,1) = ERR_MIN(ifreq);
    Freq_errmed(ti,1) = MEAN_ERR(ifreq);
    Freq_stddev(ti,1) = STDEV_ERR(ifreq);
    Freq_errmax_abs(ti,1) = max(abs([ERR_MAX(ifreq),ERR_MIN(ifreq)]));
    
    %Phase errors [%]
    if KaS ~= 0
        iph = 3;
    else
        iph = 4;
    end
    Ph_errmax(ti,1) = ERR_MAX(iph);
    Ph_errmin(ti,1) = ERR_MIN(iph);
    Ph_errmed(ti,1) = MEAN_ERR(iph);
    Ph_stddev(ti,1) = STDEV_ERR(iph);    
    Ph_errmax_abs(ti,1) = max(abs([ERR_MAX(iph),ERR_MIN(iph)]));
    
    %(KxS or KaS) errors in [%]
    if KaS ~= 0
        ik = 4;
    else
        ik = 2;
    end
    K_errmax(ti,1) = ERR_MAX(ik);
    K_errmin(ti,1) = ERR_MIN(ik);
    K_errmed(ti,1) = MEAN_ERR(ik);
    K_stddev(ti,1) = STDEV_ERR(ik);    
    K_errmax_abs(ti,1) = max(abs([ERR_MAX(ik),ERR_MIN(ik)]));
    
    %Freq_err_per_std(ti,1) = ERR_MAX(2)/STDEV_ERR(2);


    
end    

beep

% if KaS ~= 0
%     plot(errors(:,3),errors(:,4),'.')
%     title('Phase Step: Correlation \phi vs X3')
% else
%     plot(errors(:,1),errors(:,2),'.')
%     title('Mag Step: Correlation \epsilon _{x_1} vs \epsilon _{x_2}')
% end
