% Uses Britto-Martins' technique (Hilbert followed by  Levenberg-Marquadt) to find best fit for a stepped signal
% Allen Goldstein, NIST, 2020.  no copyright, free to use with this header.
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

% Samples are rows of phases and columns of samples (unfortunate but this
% is the way the calibrator was designed)

%%

Synx = 0;Freq=0;ROCOF=0;


% Find the initial guess of the step times tau
ignore = 5;     %percent of the beginning and end of the gradient of hilbert to ignore
tau = StepLocate(SampleRate,Samples,ignore);
disp(tau);
% 
% km = 3; kf = km;   % detection threshold
% ignore = 0.05;     % amount of the detection signal to ignore at each end.  (This may be set to 0 after experimments with windowed Hilbert transform
% 
% 
% dimY = size(Samples); nPhases = dimY(1);
% 
% N = length(Samples);
% t = (-(N/2)+1:(N/2))*1/SampleRate;     % time vector centered on the window
% br = dimY(2)*ignore;                   % may be removed later
% tbr = t(br:end-br);                    % time vector with ignored values removed
% 
% %% this section gets a first guess at the step location
% Y = (hilbert(Samples'))';              %find the analytic signal
% 
% % need a loop to individually calculate the gradients of each phase
% Fi = zeros(dimY);dAi = Fi;
% 
% for i = 1:nPhases
%     Fi(i,:) = gradient(unwrap(angle(Y(i,:))));  % hilbert frequency
%     dAi(i,:) = gradient(abs(Y(i,:)));           % amplitude gradient
% end
% % optional if you want to have the hilbert estimated frequency in Hz
% Fi = -Fi*SampleRate/(2*pi);
% 
% % frequency detection signal
% fm = median((Fi(:,br:end-br)),2);
% detF = abs(Fi(:,br:end-br)-fm);    %detection signal limited by the ignored samples
% [MF,IF] = max(detF,[],2);          % max value and index into the limited detection signal
% 
% disp([MF,IF]);
% 
% % amplitude detection signal
% am = median(dAi(:,br:end-br),2);
% detA = abs(Fi(:,br:end-br)-am);    % amplitude detection signal limited by the ignored samples
% [MA,IA] = max(detA,[],2);          % max value and index into the limited detection signal
% 
% disp([MA,IA]);
% 
% % Threshold detection
% critF = MF./(kf*fm);
% critA = MA./(kf*fm);
% 
% % test for no step and get tau values
% tau = NaN(nPhases);
% if ~(any(critF<1) && any(critA<1))     
%     cf = critF>=critA;
%     ca = critF<critA;
%     idx = cf.*IF+ca.*IA;
%     tau = tbr(idx);
%     
% 
% 
% %%------------------------------------------------------------DEBUGGING-------------------------------------------------------------------------------
% fig = 0;
% 
% %% Plot the analytic signal
% ya = Y(1,:);yb = Y(2,:);yc = Y(3,:);
% 
% fig = fig+1;
% figure(fig);
% 
% sgtitle('analytic signal');
% 
% subplot(3,1,1)
% plot(t,real(ya))
% hold on
% plot(t,imag(ya));
% subplot(3,1,2)
% plot(t,real(yb))
% hold on
% plot(t,imag(yb));
% subplot(3,1,3)
% plot(t,real(yc))
% hold on
% plot(t,imag(yc));
% 
% 
% %% Plot the amplitude gradient 
% dAa = dAi(1,:);dAb = dAi(2,:);dAc = dAi(3,:);
% 
% fig = fig+1;
% figure(fig);
% sgtitle('amplitude gradient')
% 
% subplot(3,1,1)
% plot(t,dAa)
% subplot(3,1,2)
% plot(t,dAb)
% subplot(3,1,3)
% plot(t,dAc)
% 
% 
% 
% %% Plot the hilbert frequency in Hz
% Fa = Fi(1,:);Fb = Fi(2,:);Fc = Fi(3,:);
% 
% fig = fig+1;
% figure(fig);
% sgtitle('Hilbert frequency (Hz)')
% 
% subplot(3,1,1)
% plot(t,Fa)
% subplot(3,1,2)
% plot(t,Fb)
% subplot(3,1,3)
% plot(t,Fc)
% 
% %% Plot the frequency detection signal
% detFa = detF(1,:);detFb = detF(2,:);detFc = detF(3,:);
% 
% fig = fig+1;
% figure(fig);
% sgtitle('frequency detection signal')
% 
% subplot(3,1,1)
% plot(tbr,detFa)
% subplot(3,1,2)
% plot(tbr,detFb)
% subplot(3,1,3)
% plot(tbr,detFc)
% 

end