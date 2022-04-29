
function [xr]=ITDCH(XT,beta1,nn,M,P)
   kk=beta1.'*nn;n=0:M-1;
   D1=exp(j*2*pi/M*kk);%D3=exp(j*2*pi/M*(kff*n))
   D2=ifft(XT,M);
   %D2=XT.'*D3;D2=D2.'
   xrr=D2*D1;
   xr=M/1*diag(xrr)