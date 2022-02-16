function [Synx, Freqs, ROCOFs, iter, SynxH] =  Fit4PFourier( SignalParams, dT, Samples)
% fits to an arbitrary number of sinewaves.  The sundamental frequecy is
% found using a 4 P fit, all other frequencies are assumed to be well
% represented in the SignalParams.  This is designed to run fast inside a calibration system.

[nSamples, nPhases] = size(Samples);

% Waveforms described as a series of cosine waves.
%Xm = SignalParams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS)
Fin = SignalParams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
%Ps = SignalParams(3,:)*pi/180;     % phase

% signalparams(4,:); is the delimiter, the first element is negative (or we should not be here)
if SignalParams(4,:) >= 0
    error ('Fit4PpFourier was called by mistake.  Always call SteadyStateFit().')
end

% pre-allocate the component parameters
nFreqs = find(SignalParams(5:end,1)<0,1,'last')-1;   % Finds the delimiter
nFreqs = nFreqs/3;
Wn = zeros(nFreqs,nPhases);
Pn = Wn;
Kn = Wn;

% while loop gets all the cosine wave parameters
for i = 1:nFreqs
    Wn(i,:) = SignalParams(5+((i-1)*3),:)*2*pi;
    Pn(i,:) = SignalParams(6+((i-1)*3),:)*pi/180;
    Kn(i,:) = SignalParams(7+((i-1)*3),:);
end

% Set up the regression loop
MaxIter = 40;
FitCrit = 1e-7;
t = (linspace(-(nSamples/2),(nSamples/2)-1,nSamples)*dT)';  % time vector with 0 at the center
Win = Fin*2*pi;

% pre-allocate
H = ones(nSamples,(3+(2*nFreqs)));
Synx = zeros(1,nPhases); Freqs = Synx; ROCOFs=Synx;
SynxH = zeros(nFreqs,nPhases);

% for each phase
for p = 1:nPhases
    w = Win(p);         % This is what will be fitted during the regression loop
    H(:,1:2) = [cos(w*t) sin(w*t)];
    
    for i = 1:nFreqs
        j = 4+(2*(i-1));
        H(:,j:j+1) = [cos(Wn(i,p)*t) sin(Wn(i,p)*t)];
    end
    S = (H'*H)\(H'*Samples(:,p));
    
    A = S(1); B = S(2); % Note DC offset is ignored
    
    % this is the regression loop to find the frequency of the fundamental
    % (classic 4-Parameter fit)
    for k = 1:MaxIter
        G = [H (-A*t.*sin(w*t) + B*t.*cos(w*t))];
        S = (G'*G)\(G'*Samples(:,p));
        A = S(1); B = S(2); % Note DC offset is ignored
        
        dw = S(size(S,1));   % change in frequency is the amplitude of the sine term
        w = w + dw;
        if dw < FitCrit
            break
        end
        % Replace the fundamental model with the new frequency
        H(:,1:2) = [cos(w*t) sin(w*t)];
        
    end
    Synx(p) = complex(A,B);
    Freqs(p) = w/(2*pi);
    ROCOFs(p) = dw/(2*pi);
    iter(p)=k;
    
    for i = 1:nFreqs
        SynxH(i,p) = complex(S(4+(i-1)*2),S(5+(i-1)*2));
    end
    
end


end