clc; close all; clear all;

%Steady State Parameters
SignalParams = zeros(10,1);
f1 = 60.0;%fund frequency
SignalParams(1) = f1;  %fund frequency

DelayCorr = zeros(6,1);
MagCorr = ones(6,1);
F0 = 60;
AnalysisCycles = 40;
SampleRate = 4800;

NSamples = floor(AnalysisCycles*SampleRate/F0);
phi_0 = 0;
nl = 0.0; %noise level
n = -NSamples/2:(NSamples/2-1); %discrete time vector
dt = 1/SampleRate;
Vm = 70*sqrt(2);
Im = 5*sqrt(2);

ferr = 0; %-1e-2; %frequency error for testing;
f1 = f1 - ferr

%modulation parameters
Aa = 0.0;%am magnitude
fa = 2; %am frequency
phia = 0*pi/180;%am phase

Af = 0.1; %pm magnitude
ff = fa; %pm frequency
phif = 0 ;   %gen37 sets phif = 0

SignalParams(1) = 0; %duration (?) NOT USED
SignalParams(2) = f1;
SignalParams(3) = fa; 
SignalParams(4) = Af;
SignalParams(5) = Aa;

phini = 0*pi/180;

%generated as genC37Signal.m
Samples = [Vm*(1+Aa*cos(2*pi*fa*n*dt+phia)).*cos(2*pi*f1*n*dt + Af*cos(2*pi*ff*n*dt+phif-pi) + phini) + nl*(rand(size(n))-0.5);
           Vm*(1+Aa*cos(2*pi*fa*n*dt+phia)).*cos(2*pi*f1*n*dt + Af*cos(2*pi*ff*n*dt+phif-pi)-2*pi/3 + phini) + nl*(rand(size(n))-0.5);
           Vm*(1+Aa*cos(2*pi*fa*n*dt+phia)).*cos(2*pi*f1*n*dt + Af*cos(2*pi*ff*n*dt+phif-pi)+2*pi/3 + phini) + nl*(rand(size(n))-0.5);
           Im*(1+Aa*cos(2*pi*fa*n*dt+phia)).*cos(2*pi*f1*n*dt + Af*cos(2*pi*ff*n*dt+phif-pi) + phini) + nl*(rand(size(n))-0.5);
           Im*(1+Aa*cos(2*pi*fa*n*dt+phia)).*cos(2*pi*f1*n*dt + Af*cos(2*pi*ff*n*dt+phif-pi)-2*pi/3 + phini) + nl*(rand(size(n))-0.5);
           Im*(1+Aa*cos(2*pi*fa*n*dt+phia)).*cos(2*pi*f1*n*dt + Af*cos(2*pi*ff*n*dt+phif-pi)+2*pi/3 + phini) + nl*(rand(size(n))-0.5);];

%adding harmonic/interharmonic
fh = 180;
Ah = 0.0; 
Harm = [Ah*Vm*sin(2*pi*fh*n*dt + phi_0);
        Ah*Vm*sin(2*pi*fh*n*dt + phi_0 - 2*pi/3);
        Ah*Vm*sin(2*pi*fh*n*dt + phi_0 + 2*pi/3);
        Ah*Im*sin(2*pi*fh*n*dt + phi_0);
        Ah*Im*sin(2*pi*fh*n*dt + phi_0 - 2*pi/3);
        Ah*Im*sin(2*pi*fh*n*dt + phi_0 + 2*pi/3);];
    
Samples = Samples + Harm;
% SignalParams(2) = fh;  %harmonic/inter frequency
% SignalParams(3) = fh;  %harmonic/inter frequency

% plot(n*dt,Samples)

%load('mod_samples.mat')
%Samples = mod_samples';
[Synx1,Freq,ROCOF] = ModulationFit ( ...
	SignalParams, ...
	DelayCorr, ...
	MagCorr, ...
	F0, ...
	AnalysisCycles, ...
	SampleRate, ...
	Samples ...
)

% load('LVSamples.mat')
% Samples = LVSamples_60_1';
% [Synx1,Freq,ROCOF] = SteadyStateFit ( ...
% 	SignalParams, ...
% 	DelayCorr, ...
% 	MagCorr, ...
% 	F0, ...
% 	AnalysisCycles, ...
% 	SampleRate, ...
% 	Samples ...
% )

% plot(n,Samples(1,:))

v = abs(Synx1)'/sqrt(2);
theta = (angle(Synx1)*180/pi)';

phasors = [v theta]

FE = Freq - f1

% phini = 0.6*pi/180;
% 
% Samples = [Vm*(1+Aa*cos(2*pi*fa*n*dt)).*cos(2*pi*f1*n*dt + Af*sin(2*pi*ff*n*dt) + phini) + nl*(rand(size(n))-0.5);
%            Vm*(1+Aa*cos(2*pi*fa*n*dt)).*cos(2*pi*f1*n*dt + Af*sin(2*pi*ff*n*dt)-2*pi/3 + phini) + nl*(rand(size(n))-0.5);
%            Vm*(1+Aa*cos(2*pi*fa*n*dt)).*cos(2*pi*f1*n*dt + Af*sin(2*pi*ff*n*dt)+2*pi/3 + phini) + nl*(rand(size(n))-0.5);
%            Im*(1+Aa*cos(2*pi*fa*n*dt)).*cos(2*pi*f1*n*dt + Af*sin(2*pi*ff*n*dt) + phini) + nl*(rand(size(n))-0.5);
%            Im*(1+Aa*cos(2*pi*fa*n*dt)).*cos(2*pi*f1*n*dt + Af*sin(2*pi*ff*n*dt)-2*pi/3 + phini) + nl*(rand(size(n))-0.5);
%            Im*(1+Aa*cos(2*pi*fa*n*dt)).*cos(2*pi*f1*n*dt + Af*sin(2*pi*ff*n*dt)+2*pi/3 + phini) + nl*(rand(size(n))-0.5);];
% 
%        
% [Synx2,Freq,ROCOF] = SteadyStateFit ( ...
% 	SignalParams, ...
% 	DelayCorr, ...
% 	MagCorr, ...
% 	F0, ...
% 	AnalysisCycles, ...
% 	SampleRate, ...
% 	Samples ...
% )
% 
% va1 = Synx1(1); va2 = Synx2(1);
% dphi = atan2(imag(va2),real(va2))*180/pi