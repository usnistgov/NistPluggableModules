% size = SizeLcmPeriod (Freqs, Fs)
% Determines the sample size of the least common multiple of cycles of a mix of
% multiple frequencies:
%
% Input:
%   [Freqs]: 1xN array of mixed frequencies
%   Fs: Sample rate
%
function size = SizeLcmPeriods(Freqs, Fs)

% first determine the LCM of the periods. 
P = 1./sym(Freqs);      % creates a symbolic object of the periods
l = lcm(P); 

% This give us a "combined" frequency.  We now need to determine how many
% samples are needed to realize an integer number of cycles in that
% combined frequency.

% First, check for fractional frequency and multiply by 10 until there is
% no fraction, if the number has too many decimal places, round it.
F = 1/double(l);    % combined "frequency"
%F = double(l);
Fmult = F;
for i = 1:4
    if rem(Fmult,1)==0;break;end
    Fmult = Fmult*10;
end
Fmult = round(Fmult);

prime = factor(Fmult);
% cyc = prime(end);
% for i = length(prime)-1:-1:1
%     s = cyc/F;
%     n = Fs*s;
%     if rem(n,1)==0;break;end
%     cyc=cyc*prime(i);
% end
i = 1;
cyc = 1;
while (i < length(prime))
    s = cyc/F;
    n = Fs*s;
    if rem(n,1)==0;break;end;
    cyc = cyc+prime(i);
    i = i+1;

end

s = cyc/F;
size = Fs*s;