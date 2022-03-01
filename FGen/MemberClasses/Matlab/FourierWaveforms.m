function [Signal,wfSize] = FourierWaveforms( ...
    t0, ...
    SettlingTime, ...
    sizeMax, ...
    FSamp, ...
    signalparams ...
    )

nPhases = size(signalparams,2);

% Waveforms described as a series of cosine waves.
Xm = signalparams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS)
Fin = signalparams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
Ps = signalparams(3,:)*pi/180;     % phase

% signalparams(4,:); is the delimiter, the first element is negative (or we should not be here)
if signalparams(4,:) >= 0
    warning ('FourierWaveforms was called by mistake.  Always call Waveforms().  Matlab is doing that for you now')
    [Signal,wfSize] = Waveforms( ...
        t0, ...
        SettlingTime, ...
        sizeMax, ...
        FSamp, ...
        signalparams ...
        );
    return
end

% pre-allocate the component parameters
[n,~]=find(signalparams(:,1)<0,1,'last');
n = (n-5)/3;
Fn = zeros(n,nPhases);
Pn = Fn;
Kn = Fn;

% while loop gets all the cosine wave parameters
idx = 1;
for i = 1:n
    Fn(i,:) = signalparams(5+((i-1)*3),:);
    Pn(i,:) = signalparams(6+((i-1)*3),:)*pi/180;
    Kn(i,:) = signalparams(7+((i-1)*3),:);
    %if signalparams(idx,:) < 0, loop = false; end    
end

% We want to make a signal that can loop without discontinuities.  Up to
% the sizeMax, this next part will calculate the length of one combined
% "cycle"
Freqs = [Fin, Fn(:,1)'];
wfSize = SizeLcmPeriods(Freqs,FSamp);
if wfSize > sizeMax; wfSize = sizeMax; end

% SettlingTime is ignored
t = (0:1/FSamp:(wfSize-1)/FSamp)';
Ain = bsxfun(@times,ones(length(t),length(Xm)),Xm);
%Theta = ones(length(t),nPhases).*(2*pi*Fin).*t + Ps-pi/2;
Theta = bsxfun (@plus,...
                     bsxfun(@times,ones(length(t),nPhases),...
                                    bsxfun(@times,(2*pi*Fin),t)...
                           ),...     
                     Ps-pi/2)...
                 ;                 
    

cSignal = (Ain.*exp(1i.*Theta));

% loop through all the frequencies
%close all
%figure(100),hold on
Wn = 2*pi*Fn;
for i = 1:size(Fn,1)
 
    %Theta = ones(length(t),nPhases).*Wn(i,:).*t + ((i+1)*Ps)+ Pn(i,:) - pi/2;
    
    Theta = bsxfun(@plus,...
                         bsxfun(@times,ones(length(t),nPhases),...
                                       bsxfun(@times,Wn(i,:),t)...
                               ),...
                               ((i+1)*Ps)+ Pn(i,:) - pi/2);...                                                          
                               
    %cSignal = cSignal + (Kn(i,:).*Ain).*exp(1i.*Theta);
    cSignal = bsxfun(@plus,cSignal,...
                           bsxfun(@times,exp(1i.*Theta),...
                                         bsxfun(@times,Kn(i,:),Ain)...
                                 )...
                    ); 
%plot(real((Kn(i,:).*Ain(:,2).*exp(1i.*Theta(:,2)))))               
end
%hold off
Signal = real(cSignal)';
%plot(Signal')
end