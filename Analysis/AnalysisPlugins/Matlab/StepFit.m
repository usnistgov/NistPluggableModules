% Uses Britto-Martins technique (Hilbert followerd by  Levenberg-Marquadt) to find best fit for a stepped signal
function [Synx,Freq,ROCOF] = StepFit (...
    SignalParams, ...
    DelayCorr, ...
    MagCorr, ...
    F0, ...
    AnalysisCycles, ...
    SampleRate, ...
    Samples ...
    )

%% Initial Signal Parameters

%  Note that the labeling convention comes mostly from the PMU standard
Xm = SignalParams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
Fin = SignalParams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
Ps = SignalParams(3,:);     % phase
%Fh = SignalParams(4,:);     % Frequency of the interfering signal
%Ph = SignalParams(5,:);     % Phase of the interfering signal
%Kh = SignalParams(6,:);     % index of the interfering signal
%Fa = SignalParams(7,:);     % phase (angle) moduation frequency
%Ka = SignalParams(8,:);     % phase (angle) moduation index
%Fx = SignalParams(9,:);     % amplitude moduation frequency
%Kx = SignalParams(10,:);     % amplitude moduation index
%Rf = SignalParams(11,:);     % ROCOF
KaS = SignalParams(12,:);   % phase (angle) step index
KxS = SignalParams(13,:);   % magnitude step index

FundFrequency = Fin(1);  % fundamental frequency (assumes all phases are the same frequency)

%%
% total time vector
Synx = 0;Freq=0;ROCOF=0;

N = length(Samples);
t = (-(N/2)+1:(N/2))*1/SampleRate;     % time vector


%% this section gets a first guess at the step location
Y = (hilbert(Samples'))';              %find the analytic signal
Ai = abs(Y);                           % Magnitude of the analytic signal
dAi = (diff(Ai'));
MA = median(dAi);
dmAi = dAi - MA;                        % amplitude detection signal
dmAi = abs(dmAi);
[dmmax,imax] = max(dmAi);

Pi = angle(Y);Pi = unwrap(Pi')';       % unwrapped angle of the analytic signal
Fi = -(diff(Pi')'*SampleRate)/(2*pi);  % find the frequency  (may not need to do the scaling by SampleRate/2pi because we are just looking for discontinuities



%%------------------------------------------------------------DEBUGGING-------------------------------------------------------------------------------
fig = 0;


%% Plot the analytic signal
fig = fig+1;
figure(fig);
ya = Y(1,:);yb = Y(2,:);yc = Y(3,:);

subplot(3,1,1)
plot(t,real(ya))
hold on
plot(t,imag(ya));
subplot(3,1,2)
plot(t,real(yb))
hold on
plot(t,imag(yb));
subplot(3,1,3)
plot(t,real(yc))
hold on
plot(t,imag(yc));


%% Plot the Ai 
Aa = Ai(1,:);Ab = Ai(2,:);Ac = Ai(3,:);


fig = fig+1;
figure(fig);

subplot(3,1,1)
plot(t,Aa)
subplot(3,1,2)
plot(t,Ab)
subplot(3,1,3)
plot(t,Ac)

%% Plot the amplitude detection signal
fig = fig+1;
figure(fig);
dmAa = dmAi(:,1);dmAb = dmAi(:,2);dmAc = dmAi(:,3);
subplot(3,1,1)
plot(t(1:end-1),dmAa)
subplot(3,1,2)
plot(t(1:end-1),dmAb)
subplot(3,1,3)
plot(t(1:end-1),dmAc)

imax

%% Plot the Fi
Fa = Fi(1,:);Fb = Fi(2,:);Fc = Fi(3,:);

fig = fig+1;
figure(fig);

subplot(3,1,1)
plot(t(1:end-1),Fa)
subplot(3,1,2)
plot(t(1:end-1),Fb)
subplot(3,1,3)
plot(t(1:end-1),Fc)
end