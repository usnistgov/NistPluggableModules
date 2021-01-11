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