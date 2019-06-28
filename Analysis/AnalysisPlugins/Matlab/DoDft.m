function DFT = DoDft(Y)


% Y is two dimensional, columns of phases and rows of data
[m,N] = size(Y);
n = 0:1:N-1;    % row vector for n
k = n;          %row vector for k
WN = exp(-1j*2*pi/N);
nk = n'*k;      % n x k matrix
DFT = zeros(m,N);
WNnk = WN.^nk;   % DFT matrix

for i = 1:m
    DFT(i,:) = WNnk*Y(i,:)';
end


end