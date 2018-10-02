function [Wn] = Window (...
    N, ...
    sWindowType ...
    )
switch sWindowType
    case 'Rectangular'
        Wn = ones (N+1,1);
    case 'Hamming'
        Wn = hamming(N);
    case 'Blackman'
        Wn = blackman(N+1);
    case 'Hann'
        Wn = hann (N+1);
    otherwise
        error('Unknown Window Type'); 
end
        

