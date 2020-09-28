% Uses Britto-Martins' technique (Hilbert followed by  Levenberg-Marquadt) to find best fit for a stepped signal
% Allen Goldstein, NIST, 2020.  no copyright, free to use with this header.
function [tau, freq] = StepLocate (...
    SampleRate, ...
    Samples, ...
    ignore ...
    )

% Samples are rows of phases and columns of samples (unfortunate but this
% is the way the calibrator was designed long ago)

%% Initialization
km = 10; kf = 3;   % detection threshold
ignore = ignore/100;     % amount of the detection signal to ignore at each end.  (This may be set to 0 after experimments with windowed Hilbert transform

dimY = size(Samples); nPhases = dimY(1);

N = dimY(2);
t = (-(N/2):(N/2)-1)/SampleRate;     % time vector centered on the window
br = N*ignore;                   % may be removed later
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
%freq = -mean(Fi,2)*SampleRate/(2*pi);

% frequency detection signal
fm = median(Fi(:,br:end-br),2);
freq = -fm*SampleRate/(2*pi);
detF = abs(Fi(:,br:end-br)-fm(1,:));    %detection signal limited by the ignored samples
[MF,IF] = max(detF,[],2);          % max value and index into the limited detection signal

% amplitude detection signal
am = median(abs(dAi(:,br:end-br)),2);
detA = abs(dAi(:,br:end-br)-am(1,:));    % amplitude detection signal limited by the ignored samples
[MA,IA] = max(detA,[],2);          % max value and index into the limited detection signal

% Threshold detection
critF = MF./(kf*fm);
critA = MA./(km*am);

% test for no step and get tau values
tau = NaN(nPhases,1);
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
fig = fig+1;
figure(fig);
%sgtitle('analytic signal');    %does not work in LV 2015

for i = 1:nPhases
    subplot(nPhases,1,i)
    plot(t,real(Y(i,:)),t,imag(Y(i,:)))
end
%% Plot the amplitude gradient 
fig = fig+1;
figure(fig);
%sgtitle('amplitude detection signal')  %does not work in LV 2015


for i = 1:nPhases
    subplot(nPhases,1,i)
    plot(tbr,detA(i,:))
end

%% Plot the hilbert frequency in Hz
fig = fig+1;
figure(fig);
%sgtitle('Hilbert frequency (Hz)')  %does not work in LV 2015

for i = 1:nPhases
    subplot(nPhases,1,i)
    plot(t,Fi(i,:))
end

%% Plot the frequency detection signal
detFa = detF(1,:);detFb = detF(2,:);detFc = detF(3,:);

fig = fig+1;
figure(fig);
%sgtitle('frequency detection signal') %does not work in LV 2015

for i = 1:nPhases
    subplot(nPhases,1,i)
    plot(tbr,detF(i,:))
end
%%-------------------------------------------------------------------------
end