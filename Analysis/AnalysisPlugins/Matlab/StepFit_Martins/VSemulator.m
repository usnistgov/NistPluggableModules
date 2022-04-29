function [vout] = VSemulator(Input,nbits,SNR)
%voltage source emulator
%outputs a voltage signal from the analog input Input, 
%nbits is the number of bits, and spurious noise with ratio SNR

%quantization
quant=max(Input)/(2^(nbits-1)-1);
y=round(Input/quant);
vout = y/max(abs(y));

%spurious noise addition
var_sig = std(Input);
eta = var_sig/10^(SNR/20); %eq (3) CPEM
vout = vout + normrnd(0,eta,[1,length(Input)]);

