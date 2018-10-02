function w = hann(L)

N = L-1;
w = zeros(L,1);
for n=0:N;
    w(n+1) = 0.5*(1-cos(2*pi*n/N));
end