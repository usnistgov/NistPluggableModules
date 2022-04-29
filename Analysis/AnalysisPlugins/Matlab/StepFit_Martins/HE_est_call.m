clear all; close all; clc;

SNR = 60; %Signal Noise Ratio
Ps = 0;  %Initial phase
KxS = 0.1; % magnitude step [relative]
KaS = 0; % phase step [degrees]
tau1 = 0.5;  % step instant in [%] of the time window
SAG_cycles = 10; %duration of SAG in number of f0 cycles
km = 3;  %threshold multiplier for magnitude
kf = 3;  %threshold multiplier for frequency

[tau_error_HE,FE] = HE_estimator(SNR,KxS,KaS,Ps,tau1,SAG_cycles, km,kf)