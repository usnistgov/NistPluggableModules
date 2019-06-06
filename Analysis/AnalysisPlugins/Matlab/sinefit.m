function varargout = sinefit(varargin)
% IEEE Standard for Digitizing Waveform Recorders (IEEE Std 1057):
% Algorithm for least squares fit to sinewave data using matrix 
% operations:
% - three-parameter (known frequency, non-iterative) and 
% - four-parameter (general use, find w iteratively).
%
% Added features:
% - Complex sinusoid fit enabled.
% - Alternative 4-parameter fit by using the function fminbnd.
%
% USAGE:
% params = sinefit(y,t,w)
% params = sinefit(y,t,w,TolX)
% params = sinefit(y,t,w,TolX,MaxIter)
% [params,yest,yerr,rmserr,iter,exitflag] = sinefit(...)
% [...] = sinefit(H,y,t,w,...)
%
% INPUTS:
% y          Input data vector to be fitted (real or complex).
% t (scalar) Sampling interval for linearly equally spaced time vector.
% t (vector) Time vector, can be unequally spaced.
% w (scalar) Angular frequency (rad/s) of the sinusoid.
%            Either the known freq or an initial guess. 
% w (vector) If length(w)==2, this function will attemp to find w 
%            between w(1) and w(2) using fminbnd (optimization toolbox).
% H          Optional fit function handle e.g. @sin. Default H=@cos.
%            Non-sinusoid H is legal, but not recommended. 
%
% [Inputs TolX and MaxIter are used in case of 4-parameter sinefit]
% TolX       Termination tolerance on optimizing w, a positive scalar.
%            If length(w)==1, 4-parameter sinefit will be used.
%            If length(w)==2, fminbnd will use this TolX.
%            Default: TolX = 1e-4.
% MaxIter    Maximum number of iterations allowed by 4-parameter sinefit or
%            fminbnd. Default: MaxIter = 500.
%
% OUTPUTS:
% params    The fit parameters. A vector [Offs,A,pha,w], where
%           - Offs	is the offset
%           - A     is the amplitude
%           - pha   is the phase (rad)
%           - w     is the angular frequency (rad/s)
% yest      Sinefit of y.
% yerr      Fit residual (y-yest).
% rmserr    Root-Mean-Square of the residual.
% iter      Number of iterations used to obtain the fit.
% exitflag  1: sinefit converged successfully.
%           0: MaxIter exceeded.
%
% Please note:
%   If the input y is complex, the fit is yi+j*yq, where
%           yi = offi+Ai*cos(w*t+phi) and
%           yq = offq+Aq*sin(w*t+phq).
%   If y is complex, params contain values for both yi and yq:
%           [Offi,Ai,phi,w;Offq,Aq,phq,w]
%   If you wish to fit a multi-tone, write a dedicated script: 
%   - Find fundamental frequencies using 4-parameter sinefit
%   - Find distortion terms by 3-parameter sinefit (as you know wheir freq)
%   - In the consecutive sinefits, fit residuals (not the original).
%
% See also SINEFIT_DEMO, FMINB, QR, LSCOV, FUNCTION_HANDLE
if nargin == 0
    open sinefit_demo
    disp('Sinefit demo-script opened')
    return
end
nin = nargin;
if nin<3 && nin>0
    disp('Error: at least 3 inputs are required')
    varargout(1:nargout) = {nan};
    return
end
if isa(varargin{1},'function_handle')==1
    H=varargin{1};
    vararg = varargin(2:end);
    nin=nin-1;
else
    vararg = varargin;
    H=@cos;
end
xxx=func2str(H);
%if contains(xxx,'square') || contains(xxx,'sawtooth')
if ~isempty(strfind(xxx,'square')) || ~isempty(strfind(xxx,'sawtooth'))   
    H_old = H;
    if contains(xxx,'square')
        H=@(x) 4/pi*(sin(x));
    else
        H=@(x) 2/pi*(sin(x));
    end
end
y=vararg{1};
t=vararg{2};
W=vararg{3};
% defaults
MaxIter_default  = 500;
TolX_default     = 1e-4;
if nin>3, TolX=vararg{4}; else, TolX = TolX_default; end
if nin>4, MaxIter=vararg{5}; else, MaxIter = MaxIter_default; end
exitflag = 1;   % Initial value of exitflag (1 indicates convergence).
iter = 0;       % Initial value of iterations.
L=length(W);    % Use fminbnd if L==2 
[rows,cols]=size(y);   
[rowt,colt]=size(t);
if rows>1 && cols>1
    disp('Error: the data (input y) is a matrix.')
    disp('This function will not predict whether the data is in rows or columns.')
    varargout(1:nargout) = {nan};
    return
end
if rows == 1, y = y(:); N=cols; else, N = rows; end
if rowt == 1, t = t(:); M=colt; else, M = rowt; end
if not(N==M)
    if M==1
        t = (0:(N-1)).'*t;
        fprintf('Fitted using linearly equally spaced time vector\n')
    else
        disp('Error: the data and time vectors lengths are unequal.')
        varargout(1:nargout) = {nan};
        return
    end
end
onevec = ones(N,1);
if L==1
    w = W;
elseif L==2 % indicates the need to find best w between two values
    if exist('fminbnd','file')==2
        options = optimset('fminbnd');
        options.TolX=TolX; options.MaxIter=MaxIter;
        [w,~,exitflag,output] = fminbnd(@(W) sinefit_errfun(H,y,t,W), W(1),W(2),options);
        iter = output.iterations;
    else
        disp('Warning: fminbnd not found. Using 4-parameter sinefit instead.')
        varargout = sinefit(H,y,t,mean(W),TolX_default,MaxIter_default);
        return
    end
else
    if L==N
        if nin>3
            disp('Error: Can''t optimize w when length(w)==length(t)')
            disp('If swept-frequency cosine generator is what you intended, use three input parameters')
            varargout(1:nargout) = {nan};
            return
        else
            w=W(:); % Allowed for a 3-parameter fit
        end
    else
        disp('Error: the length of W is typically 1 or 2')
        varargout(1:nargout) = {nan};
        return
    end
end
wt=w*t;
% 3-parameter sinefit
cosvec=H(wt);
sinvec=H(wt-pi/2);
D0=[cosvec sinvec onevec];
[Q,R] = qr(D0,0);
x0 = R\(Q.'*y); 
% 4-parameter sinefit
if nin > 3 && L==1
    if nin == 4
        if not(isnumeric(TolX))
            [x0,exitflag,iter] = sinefit_4par(H,x0,y,t,onevec,W,TolX_default,MaxIter_default);
        else
            [x0,exitflag,iter] = sinefit_4par(H,x0,y,t,onevec,W,TolX,MaxIter_default);
        end
    else
        [x0,exitflag,iter] = sinefit_4par(H,x0,y,t,onevec,W,TolX,MaxIter);
    end
    w=x0(end);
    wt=w*t;
end
[Offs,A,pha] = sinefit_extract_params(x0);
%if contains(xxx,'sawtooth')
if ~isempty(strfind(xxx,'sawtooth'))
    pha = pha-pi;
end
if length(pha)==2
    params = [Offs.',A.',pha.',[w;w]];
else
    params = [Offs,A,pha,w];
end
if nargout == 0
    disp('[Offs,A,pha,w]:')
    disp(offset)
    disp(A)
    disp(pha)
    disp(w)
else
    varargout{1}=params;
end
if nargout>1
%    if contains(xxx,'square') || contains(xxx,'sawtooth')
    if ~isempty(strfind(xxx,'square')) || ~isempty(strfind(xxx,'sawtooth'))

        if length(A)==1
            yest = Offs + A*H_old(wt+pha);
        else
             yest = Offs(1) + A(1)*H_old(wt+pha(1))+...
            1i*(Offs(2) + A(2)*H_old(wt+pha(2)-pi/2));
        end
    else
        yest = x0(1)*H(wt)+x0(2)*H(wt-pi/2)+x0(3);
    end
    if rows == 1, yest = yest.';end
    varargout{2}=yest;
end
if nargout>2
    yerr = y-yest(:);
    if rows == 1, yerr = yerr.';end
    varargout{3}=yerr;
end
if nargout>3
    rmserr = norm(yerr)/sqrt(length(yerr));
    varargout{4}=rmserr;
end
if nargout>4, varargout{5}=iter;end
if nargout>5, varargout{6}=exitflag;end
if nargout>6, varargout{7}=x0; end
function err = sinefit_errfun(H,yin,t,w)
[~,~,~,rmserr] = sinefit(H,yin,t,w);
err = rmserr^2;     % is this the optimal merit for error?
function [Offs,A,phi] = sinefit_extract_params(x0)
A0=x0(1);
B0=x0(2);
if isreal(x0)
    A=sqrt(A0*A0+B0*B0);
    phi=atan(-B0/A0);
    Offs=x0(3);
    if A0<0
        phi=phi+pi;
    end
else
    B0=-B0*1i;
    A0_old = A0;
    A0 = real(A0)+1i*imag(B0);
    B0 = real(B0)+1i*imag(A0_old);
    
    A(1)=abs(A0);
    A(2)=abs(B0);
    
    phi(1) = angle(A0);
    phi(2) = angle(B0);
    Offs(1)=real(x0(3));
    Offs(2)=imag(x0(3));
end
function [x0,exitflag,iter] = sinefit_4par(H,x0,y,t,onevec,w,TolX,MaxIter)
% 4-parameter sinefit
x0=[x0;0];
iter = 0;success = 0;
while success == 0
    iter = iter + 1;
    x0_old=x0;
    w=w+real(x0_old(4));
    wt=w*t;
    cosvec=H(wt);
    sinvec=H(wt-pi/2);
    D0=[cosvec sinvec onevec -x0(1)*t.*sinvec+x0(2)*t.*cosvec];
    if isreal(y)
        [Q,R] = qr(D0,0);
        x0 = R\(Q.'*y);
	else
        x0=lscov(D0,y);
    end
    err = max(abs((x0(1:3)-x0_old(1:3))));
    
    if err < TolX || iter > MaxIter
        success = 1;
    end
end
x0(4)=real(w+x0(4));
if iter > MaxIter
    exitflag = 0; % no success or incomplete fit
else
    exitflag = 1;
end