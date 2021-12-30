function [Synx,Freq,ROCOF, iterations] = ModulationFit ( ...
    SignalParams, ...
    DelayCorr, ...
    MagCorr, ...
    F0, ...
    AnalysisCycles, ...
    SampleRate, ...
    Samples ...
    )

[~,Fin,~,~,~,~,Fa,Ka,Fx,Kx,] = getParamVals(SignalParams);

Fm = Fa; Km = Ka;
% Combined modulation assumes the same modulation frequency and index
if Ka(1) == 0
    Fm = Fx; Km = Kx; %modulation frequency
end

%ModIndex = max(Ka(1),Kx(1)); %mod index (FM or AM)
% Freqs = Fin; %fund frequency
% [NPhases, NSamples] = size(Samples);


% Freq = Freqs(1);
% ROCOFs = zeros(1,NPhases);

% wf = 2*pi*Freqs;
% wF = 2*pi*Freq;
% wm = 2*pi*Fm;
% 
% 
% %dt = 1/SampleRate;
% %tn = (-(NSamples/2-(1/2)):NSamples/2-(1/2))*dt;
% tn = linspace(-(NSamples/2),(NSamples/2)-1,NSamples)/SampleRate;
% 
% % pre-allocate results
% Ain = zeros(1,NPhases);
% Theta = zeros(1,NPhases);
% iterations = zeros(1,NPhases);
% 

% 
if Km(1) < 0.2      % Stenbakken method for narrowband (one sideband pair)
    [Synx,Freqs,ROCOFs, iterations] = ModFit2Sb(Fin,Fm,Km,Samples',1/SampleRate,MagCorr,DelayCorr);
else                % Baysian Spectrum Analysis method for wide-bandwidth FM
    [Synx,Freqs,ROCOFs, iterations] = ModFitBSA(Fin,Fm,Km,Samples',1/SampleRate,MagCorr,DelayCorr);
end % if Km > 0.2

%If 3 phases of voltage
nPhases = size(Samples,1);
if nPhases > 2
    %Calculating symmetrical components
    alfa = exp(2*pi*1i/3);
    Ai = (1/3)*[1 1 1; 1 alfa alfa^2; 1 alfa^2 alfa];
    Vabc = Synx(1:3,:);
    Vzpn = Ai*Vabc; %voltage: zero, positive and negative
    %Freq and ROCOF outputs:
    Freq = mean(Freqs(1:3));
    ROCOF = mean(ROCOFs(1:3));
    if nPhases > 5
        Iabc = Synx(4:6,:);
     Izpn = Ai*Iabc;
     Synx = [ Vabc.' Vzpn(2) Iabc.' Izpn(2)];
    else
     Synx = [ Vabc.' Vzpn(2) Synx(4:nPhases,:);];
    end
else
    Freq = Freqs;
    ROCOF = ROCOFs;
        
end
