function [Bn] = FIR ( ...
    N, ...
    dFr, ...
    iFs ...
    )

x =  2*pi*(2*dFr/iFs);
n = -N/2;
Bn = zeros(N+1,1);
for k = (1:1:N+1)
    if n == 0
        Bn(k)=1;    % avoid the divide by 0 frequency
    else
        Bn(k) = sin(x*n)/(x*n); % Sinc function
    end
    n = n+1;
end
    

