function [tau_error_HE,FE] = HE_estimator(SNR,KxS,KaS,Ps,tau1,SAG_cycles, km,kf)
% estimates number of tau_error > 2dt using HE estimator
%clear all; close all; clc;

%nominal parameters
F0 = 60; F1 = 60; Fs = 4800;
%Ps = 90; 
NCycles = 6;
dt = 1/Fs;
k = 1;
AnalysisCycles = 6;
NSamples = floor(AnalysisCycles*Fs/F0);
tau_pp = tau1;
tau2 = tau1+SAG_cycles*(Fs/F0)/NSamples; % time to end SAG in [%]
br = 0.05*NSamples; % 5% of NSamples are taken off at the beggining and end

    n = -NSamples/2:(NSamples/2-1); %discrete time vector
    %tau_pp_set = 0.1:0.1:0.9; % relative time of step in percent of total time 
    %a = tau_pp_lims(1); b = tau_pp_lims(2);
    %tau_pp(k) = a + (b-a).*rand(1);
    tau_0 = (tau_pp(k) - 0.5)*NSamples; %discrete time displacement
    n = n - tau_0;
    t = n*dt; %time vector
    %Vm = 0.9; 
    %Vm = Vm + Vm*2*UVm/100*(rand-0.5);
    %Ps = Pin + 2*UPs/100*(rand-0.5);%phase in degrees
    Ps_deg(k) = Ps;

    % Phase in radians
    Ph = Ps*pi/180;

    %KaS = 0;   % IEEE Std phase (angle) step index: 10 degrees
    %KaS = KaS; + KaS*2*UKa/100*(rand-0.5);
    %KxS = 0.1;   % magnitude step index: 0.1 
    %KxS = KxS + KxS*2*UKx/100*(rand-0.5);
    Wf = 2*pi*F1;  % fundamental frequency

    Signal = SigGEN(F0,F1,Fs,Ps,NCycles,tau1,tau2,SNR,KaS, KxS);
    
    %SNR_hist(k) = snr(Signal,noise);
    %SNR_est(k)=10*log10(var(rSignal)/var(noise));
    plot(Signal)
    %%%% Estimation of tau
    %br = 0.05*NSamples; % 5% of NSamples are taken off at the beggining and end
    %br = 0.02*NSamples; % 2% of NSamples are taken off at the beggining and end
    z=hilbert(Signal');  % calculates the analytic signal associated with Signal

    df=gradient(unwrap(angle(z)));% Hilbert estimate of the instantaneous frequency of z
    fest = median(df(br:end-br)); %frequency estimate
    fest_hz = fest*Fs/(2*pi);
    df=abs(df-fest); %v3mod
    
    %Ain = (Ain - mean(Ain))./abs(Ain);
    nn = 1:(NSamples);
   
    [ifmax_fase, imax_fase] = max(abs(df(br:end-br))); %max indices
    limiar_fase=kf*median(abs(df(br:end-br)));
    
    gmi=gradient(abs(z)); % estimate of the gradient of instantaneous magnitude of z
    gmi=abs(gmi-median(gmi(br:end-br))); %v3mod
    [ifmax_mag, imax_mag] = max(abs(gmi(br:end-br))); %max indices
    limiar_mag=km*median(abs(gmi(br:end-br)));
    
    % Threshold detection - v4mod
    crit1 = ifmax_fase(1)/limiar_fase; %fase
    crit2 = ifmax_mag(1)/limiar_mag; %mag
    if (crit1<1 && crit2<1) %not valid detections
        tau_e=NaN;
        %det_nan = det_nan+1;
    elseif crit1>crit2  %fase detec
        tau_e=(br + imax_fase(1)-1)*dt;
        %det_fase = det_fase +1;
    else %mag detec
        tau_e=(br + imax_mag(1)-1)*dt;
        %det_mag = det_mag + 1;
    end

    tau = (tau_0 + NSamples/2)*dt;
    tau_error_HE = (tau_e - tau)/dt;
    FE = fest_hz - F1;