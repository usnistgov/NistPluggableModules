% size = SizeLcmPeriod (Freqs, Fs)
% Determines the sample size of the least common multiple of cycles of a mix of
% multiple frequencies:
%
% Input:
%   [Freqs]: 1xN array of mixed frequencies
%   Fs: Sample rate
%
function size = SizeLcmPeriods(Freqs, Fs)

%--------------- ARG: The below requires the symbolic toolbox-----------
% % first determine the LCM of the periods.
% P = 1./sym(Freqs);      % creates a symbolic object of the periods
% l = lcm(P);
% ----------
% % We can work around needing the symbolic toolbox by converting to rational numbers
P = 1./Freqs;   % periods
P = rats(P);    % rational number of the periods
P = strsplit(P);    % separate the rational numbers into a cell array
P = P(2:end-1);     % first and last elements are whitespace

% the get the numerators and denominators
n = zeros(numel(P),1); d = n;
for i = 1:numel(P)    
    r = strsplit(P{i},'/');
    n(i) = str2double(r{1,1}); d(i) = str2double(r{1,2});
end
nLcm = lcms(n);     % added an lcm set function to matlab path
dHcf = hcfs(d);     % added and hcf (gcd) set function to matlab path
l = nLcm/dHcf;      % lcm is the lcm of the numerators divided by the gcd of the denominators
%-----------------------------------------------------------------------


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

i = 1;
cyc = 1;
while (i <= length(prime))
    s = cyc/F;
    n = Fs*s;
    if rem(n,1)==0;break;end;
    cyc = cyc*prime(i);
    i = i+1;

end

s = cyc/F;
size = Fs*s;