function w = blackman(N)

M = round(N/2);
w = zeros(N,1);
for n = 0:M-1
    w(n+1) = 0.42-0.5*cos(2*pi*n/(N-1)) + 0.08*cos(4*pi*n/(N-1));
end
for n = 1:M-1
    w(M+n) = w(M-n);
end
