%x is a row vector
function [XT]=TDCH(x,beta,nn,M,P)
   %[Nr,Nc]=size(x);
   nn=nn.';
   %if Nr>1
    %  for L=0:1:P-1
    %      y1=x.*exp(-j*2*pi*beta(L+1)*nn/M);
   %       X(:,L+1)=1/M*fft(y1,M);
   %   end
   %else
    %   x=x.'
    %   for L=0:1:P-1
    %      y1=x.*exp(-j*2*pi*beta(L+1)*nn/M);
   %       XT(:,L+1)=1/M*fft(y1,M);
   %    end
   %end
   x=x.';
   x4=repmat(x,1,P);
   y1=x4.*exp(-j*2*pi/M*(nn*beta));
    XT=1/M*fft(y1,M);