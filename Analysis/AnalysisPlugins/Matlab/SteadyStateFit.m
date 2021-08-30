function [Synx,Freq,ROCOF] = SteadyStateFit ( ...
	SignalParams, ...
	DelayCorr, ...
	MagCorr, ...
	F0, ...
	AnalysisCycles, ...
	SampleRate, ...
	Samples ...
)

%******DEBUGGING******(alternativly: use PmuFitSave.m)********************
% name = fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output','Saved4PFit.mat');
% if exist(name,'file')
%     A = open(name);
%     P = A.P;
%     clear A;
% else
%     P = struct('SignalParams', {}, 'DelayCorr', {}, 'MagCorr', {}, 'F0', {}, 'AnalysisCycles', {}, 'SampleRate', {}, 'Samples', {});
% end
% 
% n = length(P)+1;
% P(n).SignalParams = SignalParams;
% P(n).DelayCorr = DelayCorr;
% P(n).MagCorr = MagCorr;
% P(n).F0 = F0;
% P(n).AnalysisCycles = AnalysisCycles;
% P(n).SampleRate = SampleRate;
% P(n).Samples = Samples;
% 
% save(name,'P')
%*********************DEBUGGING*****************************************

% Signal params.  Note that the labeling convention comes mostly from the
% standard
    %Xm = SignalParams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
    Fin = SignalParams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
    %Ps = SignalParams(3,:);     % phase 
    Fh = SignalParams(4,:);     % Frequency of the interfering signal
    %Ph = SignalParams(5,:);     % Phase of the interfering signal
    Kh = SignalParams(6,:);     % index of the interfering signal    
    %Fa = SignalParams(7,:);     % phase (angle) moduation frequency
    %Ka = SignalParams(8,:);     % phase (angle) moduation index
    %Fx = SignalParams(9,:);     % amplitude moduation frequency
    %Kx = SignalParams(10,:);     % amplitude moduation index
    %Rf = SignalParams(11,:);     % ROCOF
    %KaS = SignalParams(12,:);   % phase (angle) step index
    %KxS = SignalParams(13,:);   % magnitude step index

FundFrequency = Fin(1);  % fundamental frequency

%HarmFrequency = SignalParams(2);
% InterHarmFrequency = SignalParams(3);
% HarmIndex = SignalParams(7);
% InterHarmIndex = SignalParams(8);
% fh = max(HarmFrequency,InterHarmFrequency);
NHarm = 1;
if Kh(1)>0; NHarm = 2; end

[NPhases,N] = size(Samples);

%algorithms based on the IEEE Std 1057 - Annex A
Freqs(1:NPhases) = Fin;
ROCOFs(1:NPhases) = 0;
Ain(1:NPhases) = 0;
Theta(1:NPhases) = 0;
AinH(1:NPhases) = 0;
ThetaH(1:NPhases)=0;

%time-base
tn = linspace(-(N/2),(N/2)-1,N)*(1/SampleRate);
%tn = (-(N/2-(1/2)):N/2-(1/2))/SampleRate;
FitCrit = 1e-8;   
MaxIter = 10;

for p = 1:NPhases    
    %Pre-fit: generate the model using first estimated frequency
    w = 2*pi*FundFrequency;
    wh = 2*pi*Fh(p);
    H = [cos(w*tn)' sin(w*tn)' ones(1,N)'];
    if NHarm>1
        H = [H cos(wh*tn)' sin(wh*tn)'];
    end

    %traditional least squares linear fit  - LV uses SVD
    % fitting function: x[n] = Vdc + A*cos(2*pi*f*tn) + B*sin(2*pi*f*tn)
    %                              + C*cos(2*pi*fh*tn) + D*sin(2*pi*fh*tn)
    %S = inv(H'*H)*(H'*Samples(p,:)');  %Matlab warns that inv(A)*b is less accurate and efficient than A\b
    S = (H'*H)\(H'*Samples(p,:)');
    A = S(1); B = S(2); DC = S(3);
    if NHarm>1;C = S(4); D = S(5);end   
    
    %Four parameter iterative fit
    for k = 1:MaxIter    
        % update model -- adding frequency variation model
        H = [cos(w*tn)' sin(w*tn)' ones(1,N)'];
        if NHarm>1
            H = [H cos(wh*tn)' sin(wh*tn)'];
        end
        G = [H (-A*tn.*sin(w*tn) + B*tn.*cos(w*tn))'];
        S = (G'*G)\(G'*Samples(p,:)');
        A = S(1); B = S(2); 
        if NHarm>1
            C = S(4); D = S(5);
        end
        dw = S(size(S,1));
        w = w + dw;
        
        if dw < FitCrit
            break
        end
    end
    
%**********************DEBUGGING*******************************************        
%residuals
%     bestFit = S'*G';
%     r = Samples(p,:) - bestFit;
%     figure(p)
%     plot(tn,Samples(p,:),'-b',tn,bestFit,'-g',tn,r*100,'-r')
%     erms(p) = sqrt((1/N)*sum(r.^2));
%**********************DEBUGGING*******************************************        
    
    
    
    Freqs(p)=w/(2*pi);
    ROCOFs(p)=dw/(2*pi);

    Ain(p) = sqrt(A^2 + B^2)*MagCorr(p);
    Theta(p) = atan2(B,A) + DelayCorr(p)*1e-9*2*pi*Freqs(p);
    if NHarm > 1
        AinH(p) = sqrt(C^2 + D^2)*MagCorr(p);
        ThetaH(p) = atan2(D,C) + DelayCorr(p)*1e-9*2*pi*Fh(p);        
    else
        AinH(p) = 0;
        ThetaH(p) = 0;
    end
end

% for p=1:NPhases
%     vrms(p) = sqrt(sum(Samples(p,:).^2)/NSamples);
% end

%Fit - magnitude and phase
Synx = (Ain/sqrt(2).*exp(-1i.*Theta)).';

%Calculating symmetrical components
alfa = exp(2*pi*1i/3);
Ai = (1/3)*[1 1 1; 1 alfa alfa^2; 1 alfa^2 alfa];

Vabc = Synx(1:3,:);
Vzpn = Ai*Vabc; %voltage: zero, positive and negative sequence

Iabc = Synx(4:6,:);
Izpn = Ai*Iabc; %curren: zero, positive and negative sequence

%Synx output:
Synx = [ Vabc.' Vzpn(2) Iabc.' Izpn(2)];

%Harmonics or interharmonics are output to verify a calibrator
if NHarm > 1
    SynxH = (AinH/sqrt(2).*exp(-1i*ThetaH));
    Synx = horzcat(Synx, SynxH);    
end

Freq = mean(Freqs(1:3)); % average of the voltage frequencies 
ROCOF = mean(ROCOFs(1:3));
