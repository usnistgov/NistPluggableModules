function w = hamming(L)

N = L;

w = zeros(L,1);
for n = -N/2:N/2;
    w(n+1+N/2,1) = 0.54+0.46*cos(2*pi*n/N);
end