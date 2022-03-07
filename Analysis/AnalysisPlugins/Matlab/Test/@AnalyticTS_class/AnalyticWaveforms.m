% ANALYTICWAVEFORMS a modification of the PMU wagveforms that returns the analytic
% (complex) signals for the purpose of testing
%
% This function returns a timeseries which is either an integer number of
% periods long or is equal to sizeMax, whichever is shorter.  A period may
% be a modulation period or include harmonics or interharmonics.
%
function obj = AnalyticWaveforms(obj)

t0 = obj.T0;
SettlingTime = obj.SettlingTime;
sizeMax = obj.Duration*obj.SampleRate;
FSamp = obj.SampleRate;
wfSize = sizeMax;    % this is the waveform NOT INCLUDING the settling time added to both ends

% ARG: 2022/02/15:  Adding "fourierWaveforms", a means of creating arbitrary waves from multiple sinewaves
if obj.SignalParams(4,1) >= 0
    
    % this is the classic AnalyticWaveforms, see the bottom for AnalyticWaveforms
    [Xm,Fin,Ps,Fh,Ph,Kh,Fa,Ka,Fx,Kx,Rf,KaS,KxS,KfS,KrS] = obj.getParamVals(obj.SignalParams);
    
    % If SettlingTime <= 0, and this is not a step test or ramp, then determine the
    % sample size that gives an interger number of periods of the "combined"
    % frequency of the fundamental and any added intefering frequency or
    % modulation that may be added.
    
    stepIdx = all([Rf; KaS; KxS; KfS; KrS]');
    noSteps = all(stepIdx == 0);
    Freqs = Fin(1,1);
    if Kh(1) > 0; Freqs = [Freqs, Fh(1,1)]; end
    if Ka(1) > 0; Freqs = [Freqs, Fa(1,1)]; end
    if Kx(1) > 0; Freqs = [Freqs, Fx(1,1)]; end
    
    if (SettlingTime <= 0 && noSteps)
        wfSize = obj.SizeLcmPeriods(Freqs, FSamp);
        if wfSize > sizeMax; wfSize = sizeMax; end
    end
    
    % calculate the angular frequencies
    Wf = 2*pi*Fin;  % fundamental frequency
    Wa = 2*pi*Fa;   % phase (angle) modulation frequency
    Wx = 2*pi*Fx;   % amplitude modulation frequency
    Wh = 2*pi*Fh;
    
    % create the time array.  Add the settling time to both ends of the size
    %t = -SettlingTime:1/FSamp:((wfSize-1)/FSamp)+SettlingTime;
    
    %t = linspace(-SettlingTime,SettlingTime+((wfSize-1)),wfSize)/FSamp;
    t = linspace(-SettlingTime,SettlingTime+((wfSize-1)/FSamp),wfSize+(2*SettlingTime*FSamp));%/FSamp;
    
    % Amplitude, AM and magnitude step
    Ain = zeros(length(Xm),length(t));
    for i = 1:length(Xm)
        Ain(i,:) = Xm(i) *(1+Kx(i)*cos((Wx(i)*t)));
        % Amplitude Step: applied after time passes 0
        %Ain(i,t >= 0+t0) = Ain(i,t >= 0+t0) * (1 + KxS(i));
        Ain(i,(t >= t0)&(t <= SettlingTime+t0)) = Ain(i,(t >= t0)&(t <= SettlingTime+t0))* (1 + KxS(i));
    end
    
    % Phase
    Theta = zeros(length(Ps),length(t));
    for i = 1:length(Ps)
        Theta(i,:) = (Wf(i)*t) ...                         % Fundamental
            + Ps(i)*(pi/180) ...               % phase shift
            - ( ...
            (Ka(i)*cos((Wa(i)*t)-pi)) ...     % Phase modulation
            );
    end
    
    % Phase Step
    if KaS(1) ~= 0
        for i = 1:length(KaS)
            %Theta(i,t >= (0+t0)) = Theta(i,t >= (0+t0)) + (KaS(i) * pi/180);
            Theta(i,(t >= t0)&(t <= SettlingTime+t0)) = Theta(i,(t >= t0)&(t <= SettlingTime+t0)) + (KaS(i) * pi/180);
        end
    end
    
    % frequency ramp
    rampIdx = all([Rf; KrS]');
    if ~(all(rampIdx == 0))
        if all(Rf == 0); Rf = KrS; end  % prefer Rf over KrS
        for i = 1:length(Rf)
            if Rf(i)~=0
                endRamp = (wfSize/FSamp);
                Theta(i,t>=(0+t0) & t<=endRamp) = Theta(i,t>=(0+t0) & t<=endRamp) + (pi*Rf(i)*t(t>=(0+t0) & t<=endRamp).^2);
                %Theta(i,t>(endRamp+t0)) = Theta(i,t>(endRamp+t0)) + (pi*Rf(i)*(endRamp+t0)*t(t>(endRamp+t0)))+ (pi*Rf(i)*(endRamp+t0))^2;
                Theta(i,t>(endRamp+t0)) = Theta(i,t>(endRamp+t0)) + (pi*Rf(i)*(endRamp+t0)*t(t>(endRamp+t0)));
            end
        end
    end
    
    % frequency step
    if ~(all(KfS == 0))
        for i = 1:length(KfS)
            %Theta(i,t>=(0+t0)) = Theta(i,t>=(0+t0)) + ((2*pi*KfS(i))*(t(t>=(0+t0))-t0));
            if ~(KxS(i) == -1.0)
                %Theta(i,t>=(0+t0)) = Theta(i,t>=(0+t0)) + ((2*pi*KfS(i))*(t(t>=(0+t0))-t0));
                Theta(i,(t >= t0)&(t <= SettlingTime+t0)) = Theta(i,(t >= t0)&(t <= SettlingTime+t0)) + ((2*pi*KfS(i))*(t(t>=(0+t0))-t0));
            else
                % ARG 03/04/2022: Special test for frequency drop and restoration, frequency change after restoration
                Theta(i,t>=(SettlingTime+t0)) = Theta(i,t>=(SettlingTime+t0)) + ((2*pi*KfS(i))*(t(t>=(SettlingTime+t0))-t0));
            end
        end
    end
    
    % Complex signals
    cSignal = (Ain.*exp(-1i.*Theta));
    
    %-------------------------debug: frequency plot--------------------------
    % Theta = unwrap(angle(cSignal(1,:)));
    % Freq = -(diff(Theta).*FSamp/(2*pi));
    % plot(t(1:end-1),Freq);
    %-------------------------------------------------------------------------
    % Add a single harmonic or interharmonic
    if (Fh > FSamp/2)
        error('Interfering signal frequency is above FGen Nyquist frequency.  Can not generate');
    end % if
    
    for i = 1:length(Wh)
        ThetaH(i,:) = (Wh(i)*t) + Ph(i)*(pi/180);
        cSignal(i,:) = cSignal(i,:) + ((Kh(i) * (Xm(i))) * (cos(ThetaH(i,:)) + 1i*sin(ThetaH(i,:))));
    end
    
else
    
    % pre-allocate the component parameters
    nPhases = size(obj.SignalParams,2);
    [n,~]=find(obj.SignalParams(:,1)<0,1,'last');
    n = (n-5)/3;
    Fn = zeros(n,nPhases);
    Pn = Fn;
    Kn = Fn;
    
    [Xm,Fin,Ps] = obj.getParamVals(obj.SignalParams);
    Ps = Ps*pi/180;
    
    % while loop gets all the cosine wave parameters
    idx = 1;
    for i = 1:n
        Fn(i,:) = obj.SignalParams(5+((i-1)*3),:);
        Pn(i,:) = obj.SignalParams(6+((i-1)*3),:)*pi/180;
        Kn(i,:) = obj.SignalParams(7+((i-1)*3),:);
        if obj.SignalParams(idx,:) < 0, loop = false; end
    end
    
    % We want to make a signal that can loop without discontinuities.  Up to
    % the sizeMax, this next part will calculate the length of one combined
    % "cycle"
    Freqs = [Fin, Fn(:,1)'];
    wfSize = obj.SizeLcmPeriods(Freqs,FSamp);
    if wfSize > sizeMax; wfSize = sizeMax; end
    
    % SettlingTime is ignored
    t = (0:1/FSamp:(wfSize-1)/FSamp)';
    Ain = bsxfun(@times,ones(length(t),length(Xm)),Xm);
    Theta = ones(length(t),nPhases).*(2*pi*Fin).*t + Ps - pi/2;
    
% The below replaces the above for MATLAB 2015 or older    
%     Theta = bsxfun (@plus,...
%         bsxfun(@times,ones(length(t),nPhases),...
%         bsxfun(@times,(2*pi*Fin),t)...
%         ),...
%         Ps-pi/2)...
%         ;
    
    
    cSignal = (Ain.*exp(1i.*Theta));
    
    % loop through all the frequencies
    %close all
    %figure(100),hold on
    Wn = 2*pi*Fn;
    for i = 1:size(Fn,1)
        
        Theta = ones(length(t),nPhases).*Wn(i,:).*t + ((i+1)*Ps)+ Pn(i,:) - pi/2;
        
% The below replaces the above for MATLAB 2015 or older            
%         Theta = bsxfun(@plus,...
%             bsxfun(@times,ones(length(t),nPhases),...
%             bsxfun(@times,Wn(i,:),t)...
%             ),...
%             ((i+1)*Ps)+ Pn(i,:) - pi/2);...
            
        cSignal = cSignal + (Kn(i,:).*Ain).*exp(1i.*Theta);
        
% The below replaces the above for MATLAB 2015 or older            
%         cSignal = bsxfun(@plus,cSignal,...
%             bsxfun(@times,exp(1i.*Theta),...
%             bsxfun(@times,Kn(i,:),Ain)...
%             )...
%             );
    end
    %t = t';
    cSignal = cSignal';
end

obj.Ts = timeseries(cSignal');
obj.Ts.Time=t;
obj.Ts = setuniformtime(obj.Ts,'StartTime',t0,'Interval',1/FSamp);

%%-------------DEBUGGING-------------------------------------------------
% In the step test, I learned from the below that unwrapping is needed when determining frequency!
%
% fig = 0;
%
% fig = fig+1;
% figure(fig)
%
% plot(real(cSignal(1,:)));
% hold on
% plot(imag(cSignal(1,:)));
% hold off
%
% Pi = angle(cSignal);
% Pi = unwrap(Pi')';
% fig=fig+1;
% figure(fig)
% plot(Pi(1,:));
%
%
% fig=fig+1;
% figure(fig)
%
% Fi = (-diff(Pi')*FSamp/(2*pi))';
%
% plot(Fi(1,:));
%%------------------------------------------------------------------------

end

