clear all

% create a waveform to transform
Fs = 4800;
t = 0:1/Fs:20/60-1/Fs;
Y(1,:) = sin(2*pi*50*t) + 1/1000*sin(2*pi*60*t) + 1/20*sin((2*pi*200*t)+ (45*pi/180));
Y(2,:) = 1/1000*sin(2*pi*60*t) + 1/20*sin((2*pi*200*t)+ (45*pi/180));
Y(3,:) = 1/100*sin(2*pi*60*t) + 1/20*sin((2*pi*200*t)+ (45*pi/180));

n = length(Y);
% fft
T = DoDft(Y);

P2 = abs (T/n);     %two sided spectrum half magnitude
P1 = P2(1:n/2+1);   % single sided spectrum half magnitude
P1(2:end-1) = 2*P1(2:end-1);    %single sided spectrum magnitude

% calculate the frequency vector
f = Fs*(0:(n/2))/n;
logP1 = 10*log(P1);
figure(1)
stem(f,P1);
figure(2)
semilogy(f,P1);