function x = hilbert_w(xr,window,n)
%HILBERT  Modified Discrete-time analytic signal via Hilbert transform with optional windowing.
%   X = HILBERT(Xr) computes a discrete-time analytic signal
%   X = Xr + i*Xi such that Xi is the Hilbert transform of real vector Xr.
%   If the input Xr is complex, then only the real part is used: Xr=real(Xr).
%   If Xr is a matrix, then HILBERT operates along the columns of Xr.
%
%   HILBERT(Xr,window) computes a windowed hilbert transform.  Supported
%   window types are "Rectangular" (no window needed if you want to 0 bad with N as below),
%   "Hann", "Hamming", and "Blackman".
%
%   HILBERT(Xr,Window,n) computes the N-point Hilbert transform.  
%   n is a signed number to be added or removed from size(Xr). Xr is padded with 
%   zeros if it has less than N points, and truncated if it has more. 
%   Windowing is only performed on the input Xr before the padding is applied.  
%   For no windowing use the "Rectangular" window.
%
%   EXAMPLE:
%          Xr = [1 2 3 4];
%          X = hilbert(Xr)
%          % produces X=[1+1i 2-1i 3-1i 4+1i] such that Xi=imag(X)=[1 -1 -1 1] is the
%          % Hilbert transform of Xr, and Xr=real(X)=[1 2 3 4].  Note that the last half
%          % of fft(X)=[10 -4+4i -2 0] is zero (in this example, the last half is just
%          % the last element).  Also note that the DC and Nyquist elements of fft(X)
%          % (10 and -2) are purely real.
%
%   Dependencies: Window.m, hamming.m, blackman.n,hann.n
%
%%
if nargin<3, n=[]; end
if nargin<2, window='';end
if ~isreal(xr)
  warning(message('signal:hilbert:Ignore'))
  xr = real(xr);
end
% Work along the first nonsingleton dimension
[xr,nshifts] = shiftdim(xr);

% windowing
if ~(window=="")
   Wn =  Window(size(xr,1)-1,window);
   xr = xr.*Wn;
end

% if isempty(n)
%   n = size(xr,1);
% end
n = size(xr,1)+n;

x = fft(xr,n,1); % n-point FFT over columns.
h  = zeros(n,~isempty(x)); % nx1 for nonempty. 0x0 for empty.
if n > 0 && 2*fix(n/2) == n
  % even and nonempty
  h([1 n/2+1]) = 1;
  h(2:n/2) = 2;
elseif n>0
  % odd and nonempty
  h(1) = 1;
  h(2:(n+1)/2) = 2;
end
x = ifft(x.*h(:,ones(1,size(x,2))));

% Convert back to the original shape.
x = shiftdim(x,-nshifts);
