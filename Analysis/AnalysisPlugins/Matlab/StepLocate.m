% Uses Britto-Martins' technique (Hilbert followed by  Levenberg-Marquadt) to find best fit for a stepped signal
% Allen Goldstein, NIST, 2020.  no copyright, free to use with this header.
function [tau] = StepLocate (...
    SampleRate, ...
    Samples, ...
    ignore ...
    )

% Samples are rows of phases and columns of samples (unfortunate but this
% is the way the calibrator was designed long ago)

%% Initialization
km = 3; kf = km;   % detection threshold
ignore = ignore/100;     % amount of the detection signal to ignore at each end.  (This may be set to 0 after experimments with windowed Hilbert transform

dimY = size(Samples); nPhases = dimY(1);

N = dimY(2);
t = (-(N/2):(N/2)-1)/SampleRate;     % time vector centered on the window
br = dimY(2)*ignore;                   % may be removed later
tbr = t(br:end-br);                    % limited time vector with ignored values removed

%% this section gets a first guess at the step location
Y = (hilbert(Samples'))';              %find the analytic signal

% need a loop to individually calculate the gradients of each phase
Fi = zeros(nPhases,dimY(2));dAi = Fi;

for i = 1:nPhases
    Fi(i,:) = gradient(unwrap(angle(Y(i,:))));  % hilbert frequency
    dAi(i,:) = gradient(abs(Y(i,:)));           % amplitude gradient
end
% optional if you want to have the hilbert estimated frequency in Hz
Fi = -Fi*SampleRate/(2*pi);

% frequency detection signal
fm = median((Fi(:,br:end-br)),2);
detF = abs(Fi(:,br:end-br)-fm);    %detection signal limited by the ignored samples
[MF,IF] = max(detF,[],2);          % max value and index into the limited detection signal

% amplitude detection signal
am = median(dAi(:,br:end-br),2);
detA = abs(Fi(:,br:end-br)-am);    % amplitude detection signal limited by the ignored samples
[MA,IA] = max(detA,[],2);          % max value and index into the limited detection signal

% Threshold detection
critF = abs(MF./(kf*fm));
critA = abs(MA./(kf*am));

% test for no step and get tau values
tau = NaN(nPhases);
if ~(any(critF<1) && any(critA<1))     
    cf = critF>=critA;
    ca = critF<critA;
    idx = cf.*IF+ca.*IA;
    tau = tbr(idx);
end
    
%    disp(tau);
    
%%---------------------Visualization---------------------------------------
fig = 0;

%% Plot the analytic signal
ya = Y(1,:);yb = Y(2,:);yc = Y(3,:);

fig = fig+1;
figure(fig);

sgtitle('analytic signal');

subplot(3,1,1)
plot(t,real(ya))
hold on
plot(t,imag(ya));
hold off
subplot(3,1,2)
plot(t,real(yb))
hold on
plot(t,imag(yb));
hold off
subplot(3,1,3)
plot(t,real(yc))
hold on
plot(t,imag(yc));
hold off

%% Plot the amplitude gradient 
dAa = dAi(1,:);dAb = dAi(2,:);dAc = dAi(3,:);

fig = fig+1;
figure(fig);
sgtitle('amplitude gradient')

subplot(3,1,1)
plot(t,dAa)
subplot(3,1,2)
plot(t,dAb)
subplot(3,1,3)
plot(t,dAc)



%% Plot the hilbert frequency in Hz
Fa = Fi(1,:);Fb = Fi(2,:);Fc = Fi(3,:);

fig = fig+1;
figure(fig);
sgtitle('Hilbert frequency (Hz)')

subplot(3,1,1)
plot(t,Fa)
subplot(3,1,2)
plot(t,Fb)
subplot(3,1,3)
plot(t,Fc)

%% Plot the frequency detection signal
detFa = detF(1,:);detFb = detF(2,:);detFc = detF(3,:);

fig = fig+1;
figure(fig);
sgtitle('frequency detection signal')

subplot(3,1,1)
plot(tbr,detFa)
subplot(3,1,2)
plot(tbr,detFb)
subplot(3,1,3)
plot(tbr,detFc)


end