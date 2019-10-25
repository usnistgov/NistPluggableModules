%Freqs = [50 55 55 55 55 55 55];
%Fs = 4800;

function [Sizes] = IntCycles(Fs,Freqs)
%For any given frequency and sample rate, find the smallest integer number 
%of cycles that also uses an integer number of samples

% Generally the frequency will be in 10ths of a Hz, but this should be 
% able to handle several decimal places

Sizes = zeros(1,length(Freqs));

for p = 1:length(Freqs)
    
    % First, check for fractional frequency and multiply by 10 until there is
    % no fraction, if the number has too many decimal places, throw an error.
    F = Freqs(p);
    Fmult = F;
    for i = 1:4
        if rem(Fmult,1)==0;break;end
        Fmult = Fmult*10;
        if i ==4;error('Frequency should have fewer than 4 deciomal places');end
    end
    %Find the prime factors of Fmult.
    prime=factor(Fmult);
    
    % divide F by the largest prime factor, check for an integer number of
    % samples, if not integer, divide by the next largest, etc until the
    % number of samples is an integer
    cyc = prime(end);
    for i = length(prime)-1:-1:1
        s = cyc/F;
        n = Fs*s;
        if rem(n,1)==0; break;end
        cyc=cyc*prime(i);
    end
    s = cyc/F;
    Sizes(p)=Fs*s;
end
end

