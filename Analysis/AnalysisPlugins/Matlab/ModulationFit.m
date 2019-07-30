function [Synx,Freq,ROCOF, iterations] = ModulationFit ( ...
	SignalParams, ...
	DelayCorr, ...
	MagCorr, ...
	F0, ...
	AnalysisCycles, ...
	SampleRate, ...
	Samples ...
)
%Ain = [70,70,70,5,5,5];
%Theta = [0, -(2/3)*pi, (2/3)*pi, 0, -(2/3)*pi, (2/3)*pi,];
%Synx = (Ain.*exp(-1i.*Theta)).';
% Freq = 60;
% ROCOF = 0;

%SignalParams: array of doubles
% For Modulated Signals:
% LV: Mat
% 0 : 1 Duration (?)
% 1 : 2 Fundamental Frequency
% 2 : 3 Modulation Frequency
% 3 : 4 FM index
% 4 : 5 AM index

%parameters to receive as good initial estimates to the algorithms:
fm = SignalParams(3);  %modulation frequency
ModIndex = max(SignalParams(4),SignalParams(5)); %mod index (FM or AM)
Freq = SignalParams(2); %fund frequency
NSamples = size(Samples,2);
NPhases = size(Samples,1);
Freqs(1:NPhases) = Freq;
ROCOFs(1:NPhases) = 0;

dt = 1/SampleRate;
tn = (-NSamples/2:NSamples/2-1)*dt;
MaxIter = 40;
FitCrit = 1e-7;   %dFm min

if fm<1
    %Taylor model
    for p = 1:NPhases
        %Pre-fit: generate the model using first estimated frequency
        H = [ones(1,NSamples)' cos(2*pi*Freq*tn)' sin(2*pi*Freq*tn)' ];
        S = (H'*H)\(H'*Samples(p,:)');
        Vdc(1) = S(1); A(1) = S(2); B(1) = S(3);
        Ain(p) = sqrt(A(1)^2 + B(1)^2)*MagCorr(p);
        Theta(p) = atan2(B(1),A(1)) + DelayCorr(p)*1e-9*2*pi*Freq;
        for k = 1:MaxIter
            %Four parameter iterative fit
            % update model -- adding frequency variation model
            H = [ones(1,NSamples)' cos(2*pi*Freqs(p)*tn)' sin(2*pi*Freqs(p)*tn)'];
            G = [H (-A(k)*tn.*sin(2*pi*Freqs(p)*tn) + B(k)*tn.*cos(2*pi*Freqs(p)*tn))'];
            S = (G'*G)\(G'*Samples(p,:)');
            A(k+1) = S(2); B(k+1) = S(3); 
            Ain(p) = sqrt(A(k+1)^2 + B(k+1)^2)*MagCorr(p);
            Theta(p) = atan2(B(k+1),A(k+1)) + DelayCorr(p)*1e-9*2*pi*Freq; 
            dFreq(p,k) = S(size(S,1))/(2*pi);
            Freqs(p) = Freqs(p) + dFreq(p,k);
            ROCOFs(p) = dFreq(p,k);
            if dFreq(p,k)<FitCrit
                break
            end
        end
	iterations(p) = k;
    end
    Synx = (Ain/sqrt(2).*exp(-1i.*Theta)).';	    
else
    %three waveform method
    for p = 1:NPhases
        %Initialize af<phif
        Af = 0;
        vsum = 0; phif = 0; 
        Freqs(p) = 0; ROCOFs(p) = 0;

        for k = 1:MaxIter
            Afm = abs(Af); phif = angle(Af);
            %Fit sample data with model matrix    
            H = [cos(2*pi*Freq*tn + Afm*sin(2*pi*fm*tn + phif))', ...
                 sin(2*pi*Freq*tn + Afm*sin(2*pi*fm*tn + phif))', ...
                 cos(2*pi*(Freq - fm)*tn + Afm*sin(2*pi*fm*tn + phif))', ...
                 sin(2*pi*(Freq - fm)*tn + Afm*sin(2*pi*fm*tn + phif))', ...
                 cos(2*pi*(Freq + fm)*tn + Afm*sin(2*pi*fm*tn + phif))', ...
                 sin(2*pi*(Freq + fm)*tn + Afm*sin(2*pi*fm*tn + phif))', ...
                 ones(1,NSamples)'];

            S = (H'*H)\(H'*Samples(p,:)'); 
            AF(p) = sqrt(S(1)^2 + S(2)^2); phiF(p) = atan2(-S(2),S(1));
            AL = sqrt(S(3)^2 + S(4)^2); phiL = atan2(-S(4),S(3));
            AU = sqrt(S(5)^2 + S(6)^2); phiU = atan2(-S(6),S(5));
            %phiL_deg = phiL*180/pi
            %phiU_deg = phiU*180/pi

            %LV reverse engineering - ModPhaseFit.vi
            mi = (AU*cos(phiU - phiF(p)) - AL*cos(phiL-phiF(p))) + 1i*(AU*sin(phiU - phiF(p)) - AL*sin(phiL-phiF(p)));
            su = (AU*cos(phiU - phiF(p)) + AL*cos(phiL-phiF(p))) + 1i*(AU*sin(phiU - phiF(p)) + AL*sin(phiL-phiF(p)));
            fcos = abs(mi)*cos(angle(mi))/AF(p);
            fsin = abs(su)*sin(angle(su))/AF(p);
            acos = abs(su)*cos(angle(su))/AF(p);
            asin = abs(mi)*sin(angle(mi))/AF(p);
            dFm = sqrt(fcos^2 + fsin^2);
            ma = sqrt(asin^2 + acos^2);
            phia = atan2(asin,acos);
            phif = atan2(fsin,fcos);
            Af = Af + dFm*exp(1i*phif);
            if abs(dFm) < FitCrit
                break
            end
        end
        %p-phase Phasor %%%% for t=0
        ka = abs(Af); kx = ma; t1 = 0;
        AF(p) = AF(p)*(1+kx*cos(phia));  
        %phiF(p) = phiF(p) + ka*sin(phif);
        Freqs(p) = Freq + ka*fm*cos(2*pi*fm*t1 + phif);
        ROCOFs(p) = -ka*fm^2*sin(2*pi*fm*t1 + phif);
	Ain(p) = abs(AF(p))*MagCorr(p);
	Theta(p) = phiF(p) + DelayCorr(p)*1e-9*2*pi*Freq;
	iterations(p) = k;
    end
    Synx = (Ain/sqrt(2).*exp(1i.*Theta)).';
end



%Calculating simmetrical components
alfa = exp(2*pi*1i/3);
Ai = (1/3)*[1 1 1; 1 alfa alfa^2; 1 alfa^2 alfa];
Vabc = Synx(1:3,:);
Iabc = Synx(4:6,:);
Vzpn = Ai*Vabc; %voltage: zero, positive and negative
Izpn = Ai*Iabc;

%Synx output:
Synx = [ Vabc.' Vzpn(2) Iabc.' Izpn(2)];

%Freq and ROCOF outputs:
Freq = mean(Freqs);
ROCOF = mean(ROCOFs);
