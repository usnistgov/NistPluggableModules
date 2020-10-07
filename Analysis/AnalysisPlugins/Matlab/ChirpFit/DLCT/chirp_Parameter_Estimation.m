clear;
N=512;M=N;
n=0:1:N-1;nn=n.^2;
rr=0.5;P=500;
step=2*rr/P;
beta=-rr:step:rr-step;
x=1*exp(j*(2*0.2*pi*(n).^2/(1*M)+2*pi*25*(n)/M+pi/2))+1*exp(j*(-2*pi*0.1*n.^2/(1*M)+2*pi*225*n/M+pi/4));
A1=var(x,1);snr=100;randn('state',0);
sigma=sqrt(A1*10^(-snr/10));w1=sigma*randn(1,N);
x1=x+w1;
[X11]=TDCH(x1,beta,nn,M,P);
ss1=1;ss2=M/1;
[Nr,Nc]=size(X11);
m1=0:Nr-1;
X1=zeros(M,P);X5=zeros(M,2*P);
for i=1:2
    if i==1
        xe=x1;
    end
    Xw=zeros(M,P);Xw1=zeros(M,2*P);
    [X]=TDCH(xe,beta,nn,M,P);
    [g1,I1]=max(X);[g13,I3]=max(g1);
    [h1,I2]=max(X.'); [h14,I4]=max(h1);df=1;cr(i,:)=[beta(I3) I3 I4-1 abs(h14) angle(h14)];
    if I4-df<1
        Xw(1:I4+df,I3)=X(1:I4+df,I3);
    else if I4-df>0 && I4+df<M
            Xw(I4-df:I4+df,I3)=X(I4-df:I4+df,I3);
        else
            Xw(I4-df:M,I3)=X(I4-df:M,I3);
        end
    end
    Xs(:,i)=X(:,I3);%Xw(I4-df:I4+df,I3)=X(I4-df:I4+df,I3)
    X1=X1+Xw;
    [xrrr]=ITDCH(Xw,beta,nn,M,P);
    %xshift=exp(-j*2*pi/M*I3*nn.');
    xsep(:,i)=xrrr;
    %xe=xe-xrrr.';
    
    xe=xe-xrrr.';
end
xest=cr(1,4)*exp(j*2*pi/M*(cr(1,1)*n.^2+cr(1,3)*n)+j*cr(1,5))...
    +cr(2,4)*exp(j*2*pi/M*(cr(2,1)*n.^2+cr(2,3)*n)+j*cr(2,5));
%beta1
error1=mean((real(x-xest)).^2);MSE1=10*log10(error1)


figure(1)
[T1,T2] = meshgrid(m1(ss1:ss2),beta);
meshc(T2,T1,((abs(X11(ss1:ss2,:).'))));
figure(2)
subplot(311)
plot(n,real(x))
grid on
axis([0 N-1 -2.2 2.2])
subplot(312)
plot(n,real(xest))
grid on
axis([0 N-1 -2.2 2.2])
subplot(313)
plot(n,real(x)-real(xest))
grid on
axis([0 N-1 -0.1 0.1])
