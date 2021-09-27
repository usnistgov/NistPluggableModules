%% =========================================================================
% static methods
%--------------------------------------------------------------------
% size = SizeLcmPeriod (Freqs, Fs)
% Determines the sample size of the least common multiple of cycles of a mix of
% multiple frequencies:
%
% Input:
%   [Freqs]: 1xN array of mixed frequencies
%   Fs: Sample rate
%
function Size = SizeLcmPeriods(Freqs, Fs)

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
    n(i) = str2double(r{1,1});
    d(i) = 1;
    if numel(r)==2; d(i) = str2double(r{1,2}); end;
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
Size = Fs*s;
%end

%--------------------------------------------------------------------------
% Josh (2021). Least Common Multiple Set
%(https://www.mathworks.com/matlabcentral/fileexchange/24670-least-common-multiple-set),
% MATLAB Central File Exchange. Retrieved January 9, 2021.
    function output = lcms(numberArray)
        numberArray = reshape(numberArray, 1, []);
        %% prime factorization array
        for i = 1:size(numberArray,2)
            temp = factor(numberArray(i));
            
            for j = 1:size(temp,2)
                output(i,j) = temp(1,j);
            end
        end
        %% generate prime number list
        p = primes(max(max(output)));
        %% prepare list of occurences of each prime number
        q = zeros(size(p));
        %% generate the list of the maximum occurences of each prime number
        for i = 1:size(p,2)
            for j = 1:size(output,1)
                temp = length(find(output(j,:) == p(i)));
                if(temp > q(1,i))
                    q(1,i) = temp;
                end
            end
        end
        %% the algorithm
        z = p.^q;
        output = 1;
        for i = 1:size(z,2)
            output = output*z(1,i);
        end
        
        
    end
%--------------------------------------------------------------
    function out=hcfs(n1,varargin)
        % Computes Highest Common Factor of two or more numbers
        % Syntax:
        % [output variable]=hcf(number 1 [,number 2] [,..., number n])
        % For example:
        % hcf(6, 9)
        % hcf([6 9])
        % hcf(15, 30, 45)
        % combines multiple inputs into single variable
        %
        % Nitin (2021). hcf (https://www.mathworks.com/matlabcentral/fileexchange/53133-hcf),
        % MATLAB Central File Exchange. Retrieved January 9, 2021.
        
        if nargin > 1
            n1 = [n1 cell2mat(varargin(:))'];
        end
        n1=abs(n1);
        n1=round(n1);
        % Take care of zeros by eliminating them as hcf(0,a) = a
        n = n1(n1~=0);
        out=1;
        div=2;
        while div <= min(n)
            if sum(rem(n,div))==0
                out=out*div;
                n=n/div;
                div=2;
            else
                div=div+1;
            end
        end
    end
end
