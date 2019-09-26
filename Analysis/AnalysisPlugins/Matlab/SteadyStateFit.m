function [Synx,Freq,ROCOF] = SteadyStateFit ( ...
	SignalParams, ...
	DelayCorr, ...
	MagCorr, ...
	F0, ...
	AnalysisCycles, ...
	SampleRate, ...
	Samples ...
)

%SignalParams: array of doubles
% For Steady State signals:
% LV:Mat
% 0 : 1 Fundamental Frequency
% 1 : 2 Harmonic Frequency
% 2 : 3 Interharmonic Frequency
% 3 : 4 Fundamental Initial Phase (at T0)
% 4 : 5 Harmonic Initial Phase
% 5 : 6 Interharmonic Initial Phase
% 6 : 7 Harmonic Index
% 7 : 8 Interharmonic Index
% 8 : 9 Voltage Magnitude Index
% 9 : 10 Current Magnitude Index 
%AnalysisCycles: integer
%HarmFreq ?
%FundCycles: number of cycles of fundamental frequency

FundFrequency = SignalParams(1);  % fundamental frequency

%HarmFrequency = SignalParams(2);
% InterHarmFrequency = SignalParams(3);
% HarmIndex = SignalParams(7);
% InterHarmIndex = SignalParams(8);
% fh = max(HarmFrequency,InterHarmFrequency);
fh = SignalParams(2);           % harmonic frequency
NHarm = 1;
if SignalParams(3) ~= 0; NHarm = 2; end

NSamples = size(Samples,2);
NPhases = size(Samples,1);

% if (HarmIndex == 0) && (InterHarmIndex == 0) 
%     NHarm = 1;  %Only the fundamental frequency
% else
%     NHarm = 2;  %Fund frequency + one harm/inter harmonic
% end

%algorithms based on the IEEE Std 1057 - Annex A
Freqs(1:NPhases) = FundFrequency;
Freq = FundFrequency;
ROCOFs(1:NPhases) = 0;
%time-base
dt = 1/SampleRate;
%tn = (0:NSamples-1)*dt;
%tn = (-NSamples/2:NSamples/2-1)*dt;
tn = (-((NSamples/2)-(1/2)):((NSamples/2)-(1/2)))*dt;
FitCrit = 1e-5;   
MaxIter = 50;
% pre-allocate variables for speed
dFreq = zeros(NPhases,MaxIter);
A = zeros(MaxIter,1);
B = zeros(MaxIter,1);
%Ain = zeros(NPhases,1);
%Theta = zeros(NPhases,1);
AinH = zeros(NPhases,1);
ThetaH = zeros(NPhases,1);

for p = 1:NPhases    
    %Pre-fit: generate the model using first estimated frequency
    H = [cos(2*pi*FundFrequency*tn)' sin(2*pi*FundFrequency*tn)' ones(1,NSamples)'];
    if NHarm>1
        H = [H cos(2*pi*fh*tn)' sin(2*pi*fh*tn)'];
    end

    %traditional least squares linear fit  - LV uses SVD
    % fitting function: x[n] = Vdc + A*cos(2*pi*f*tn) + B*sin(2*pi*f*tn)
    %                              + C*cos(2*pi*fh*tn) + D*sin(2*pi*fh*tn)
    %S = inv(H'*H)*(H'*Samples(p,:)');  %Matlab warns that inv(A)*b is less accurate and efficient than A\b
    S = (H'*H)\(H'*Samples(p,:)');
    A(1) = S(1); B(1) = S(2);
    %Ain(p) = sqrt(A(1)^2 + B(1)^2)*MagCorr(p);
    %Theta(p) = atan2(B(1),A(1)) + DelayCorr(p)*1e-9*2*pi*Freq; 

    if NHarm>1
        C(1) = S(4); D(1) = S(5);
        %AinH(p) = sqrt(C(1)^2 + D(1)^2)*MagCorr(p);
        %ThetaH(p) = atan2(D(1),C(1)) + DelayCorr(p)*1e-9*2*pi*fh;
    %else
        %AinH(p) = 0;
        %ThetaH(p) = 0;
    end
    
    for k = 1:MaxIter
        %Four parameter iterative fit
        % update model -- adding frequency variation model
        H = [cos(2*pi*Freqs(p)*tn)' sin(2*pi*Freqs(p)*tn)' ones(1,NSamples)'];
        if NHarm>1
            H = [H cos(2*pi*fh*tn)' sin(2*pi*fh*tn)'];
        end
        G = [H (-A(k)*tn.*sin(2*pi*Freqs(p)*tn) + B(k)*tn.*cos(2*pi*Freqs(p)*tn))'];
        %S = inv(G'*G)*(G'*Samples(p,:)'); %Matlab warns that inv(A)*b is less accurate and efficient than A\b
        S = (G'*G)\(G'*Samples(p,:)');
        A(k+1) = S(1); B(k+1) = S(2); 
        %Ain(p) = sqrt(A(k+1)^2 + B(k+1)^2)*MagCorr(p);
        %Theta(p) = atan2(B(k+1),A(k+1)) + DelayCorr(p)*1e-9*2*pi*Freq; 
        if NHarm>1
            C(1) = S(4); D(1) = S(5);
            %AinH(p) = sqrt(C(1)^2 + D(1)^2)*MagCorr(p);
            %ThetaH(p) = atan2(D(1),C(1)) + DelayCorr(p)*1e-9*2*pi*fh;
        else
            %AinH(p) = 0;
            %ThetaH(p) = 0;
        end
        dFreq(p,k) = S(size(S,1))/(2*pi);
        Freqs(p) = Freqs(p) + dFreq(p,k);
        ROCOFs(p) = dFreq(p,k);
        
        %residuals
%         r = Samples(p,:) - S'*G';
%         erms(p) = sqrt((1/NSamples)*sum(r.^2));
        if dFreq(p,k)<FitCrit
            break
        end
    end
    Ain(p) = sqrt(A(k+1)^2 + B(k+1)^2)*MagCorr(p);
    Theta(p) = atan2(B(k+1),A(k+1)) + DelayCorr(p)*1e-9*2*pi*Freq;
    if NHarm > 1
        AinH(p) = sqrt(C(1)^2 + D(1)^2)*MagCorr(p);
        ThetaH(p) = atan2(D(1),C(1)) + DelayCorr(p)*1e-9*2*pi*fh;        
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

%AinH = AinH./Ain  %not used yet, but should be output to verify a calibrator
%ThetaH

Freq = mean(Freqs(1:3)); % average of the voltage frequencies 
ROCOF = mean(ROCOFs(1:3));
