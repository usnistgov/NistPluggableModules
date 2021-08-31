function [Synx,Freq,ROCOF, iterations] = ModulationFit ( ...
    SignalParams, ...
    DelayCorr, ...
    MagCorr, ...
    F0, ...
    AnalysisCycles, ...
    SampleRate, ...
    Samples ...
    )
% Citation: G. N. Stenbakken, "Calculating combined amplitude and phase
% modulated power signal parameters," 2011 IEEE Power and Energy Society
% General Meeting, Detroit, MI, USA, 2011, pp. 1-7, doi: 10.1109/PES.2011.6039442.
%

% Citation: G. N. Stenbakken, "Calculating combined amplitude and phase
% modulated power signal parameters," 2011 IEEE Power and Energy Society
% General Meeting, Detroit, MI, USA, 2011, pp. 1-7, doi: 10.1109/PES.2011.6039442.
%
[~,Fin,~,~,~,~,Fa,Ka,Fx,Kx,~,~,~,~,~] = getParamIndex(SignalParams);

%parameters to receive as good initial estimates to the algorithms:
% fm = SignalParams(3);
fm = Fa(1);Km = Ka; %modulation frequency, amplitude
% Combined modulation assumes the same modulation frequency
if Ka(1) == 0
    fm = Fx(1); Km = Kx; %modulation frequency
end

%ModIndex = max(Ka(1),Kx(1)); %mod index (FM or AM)
Freqs = Fin; %fund frequency
[NPhases, NSamples] = size(Samples);
Freq = Freqs(1);
ROCOFs = zeros(1,NPhases);

wf = 2*pi*Freqs;
wF = 2*pi*Freq;
wm = 2*pi*fm;


%dt = 1/SampleRate;
%tn = (-(NSamples/2-(1/2)):NSamples/2-(1/2))*dt;
tn = linspace(-(NSamples/2),(NSamples/2)-1,NSamples)/SampleRate;

% pre-allocate results
Ain = zeros(1,NPhases);
Theta = zeros(1,NPhases);
iterations = zeros(1,NPhases);


% ARG: 20210830:  Adding a hilbert method for high modulation index Phase
% Modulation
if Km(1) > 0.2
    
    for p = 1:NPhases
        
        H = hilbert(Samples(p,:));
        N = length(H);
        odd = rem(length(H),2)==1;
        if ~odd
            idx = N/2+1;
            Ain(p) = abs(H(idx))*MagCorr(p);
            phi = angle(H(idx-2:idx+2));
            Theta(p) = phi(3)+ DelayCorr(p)*1e-9*wF;
            freqs = diff(unwrap(phi))*(SampleRate/(2*pi));
            tf = -1.5/SampleRate:1/SampleRate:1.5/SampleRate;
            Freqs(p) = interp1(tf,freqs,0,'PCHIP');
            ROCOFS = gradient(freqs);
            ROCOFs(p) = interp1(tf,ROCOFS,0,'PCHIP');
            
        else
            
        end
        
    end
    Synx = (Ain/sqrt(2).*exp(1i.*Theta)).';

    
    
else
    MaxIter = 40;
    FitCrit = 1e-7;   %dFm min
    
%    iterations = zeros(1,NPhases);
    
    if fm<0
        %Taylor model
        
        % pre-allocate arrays for speed
        A = zeros(MaxIter,1); B = zeros(MaxIter,1);
        dFreq = zeros(NPhases,MaxIter);
        
        for p = 1:NPhases
            %Pre-fit: generate the model using first estimated frequency
            H = [ones(1,NSamples)' cos(wF*tn)' sin(wF*tn)' ];
            S = (H'*H)\(H'*Samples(p,:)');
            %Vdc(1) = S(1);
            A(1) = S(2); B(1) = S(3);
            for k = 1:MaxIter
                %Four parameter iterative fit
                % update model -- adding frequency variation model
                H = [ones(1,NSamples)' cos(wf(p)*tn)' sin(wf(p)*tn)'];
                G = [H (-A(k)*tn.*sin(wf(p)*tn) + B(k)*tn.*cos(wf(p)*tn))'];
                S = (G'*G)\(G'*Samples(p,:)');
                A(k+1) = S(2); B(k+1) = S(3);
                dFreq(p,k) = S(size(S,1))/(2*pi);
                wf(p) = 2*pi*(Freqs(p) + dFreq(p,k));
                ROCOFs(p) = dFreq(p,k);
                if dFreq(p,k)<FitCrit
                    break
                end
            end
            Ain(p) = sqrt(A(k+1)^2 + B(k+1)^2)*MagCorr(p);
            Theta(p) = atan2(B(k+1),A(k+1)) + DelayCorr(p)*1e-9*wF;
            iterations(p) = k;
        end
        Synx = (Ain/sqrt(2).*exp(-1i.*Theta)).';
    else
        %three waveform method
        for p = 1:NPhases
            %Initialize af<phif
            Af = Km(p);
            phif = 0;
            Freqs(p) = 0; ROCOFs(p) = 0;
            
            for k = 1:MaxIter
                Afm = abs(Af); phif = angle(Af);
                %Fit sample data with model matrix
                H = [cos(wF*tn + Afm*sin(wm*tn + phif))', ...
                    sin(wF*tn + Afm*sin(wm*tn + phif))', ...
                    cos((wF-wm)*tn + Afm*sin(wm*tn + phif))', ...
                    sin((wF-wm)*tn + Afm*sin(wm*tn + phif))', ...
                    cos((wF+wm)*tn + Afm*sin(wm*tn + phif))', ...
                    sin((wF+wm)*tn + Afm*sin(wm*tn + phif))', ...
                    ones(1,NSamples)'];
                
                S = (H'*H)\(H'*Samples(p,:)');
                
                
                %-------------- DEBUG -----------------------------------
                % plot the model, original and the residual
                %             fit = sum(S.*H',1);
                %             figure(3)
                %             subplot(2,1,1)
                %             plot(tn,Samples(p,:));
                %             hold on
                %             plot(tn,fit')
                %             hold off
                %             subplot(2,1,2)
                %             plot(tn,(Samples(p,:)-fit)')
                %             %pause
                %-------------------------------------------------------------
                AF = sqrt(S(1)^2 + S(2)^2); phiF = atan2(-S(2),S(1));
                AL = sqrt(S(3)^2 + S(4)^2); phiL = atan2(-S(4),S(3));
                AU = sqrt(S(5)^2 + S(6)^2); phiU = atan2(-S(6),S(5));
                
                %LV reverse engineering - ModPhaseFit.vi
                mi = (AU*cos(phiU - phiF) - AL*cos(phiL-phiF)) + 1i*(AU*sin(phiU - phiF) - AL*sin(phiL-phiF));
                su = (AU*cos(phiU - phiF) + AL*cos(phiL-phiF)) + 1i*(AU*sin(phiU - phiF) + AL*sin(phiL-phiF));
                fcos = abs(mi)*cos(angle(mi))/AF;
                fsin = abs(su)*sin(angle(su))/AF;
                acos = abs(su)*cos(angle(su))/AF;
                asin = abs(mi)*sin(angle(mi))/AF;
                dFm = sqrt(fcos^2 + fsin^2);
                ma = sqrt(asin^2 + acos^2);
                phia = atan2(asin,acos);
                phif = atan2(fsin,fcos);
                Af = (Af + dFm*exp(1i*phif));
                if abs(dFm) < FitCrit
                    break
                end
            end
            %p-phase Phasor %%%% for t=0
            ka = abs(Af); t1 = 0;
            AF = AF*(1+ma*cos(phia));
            phiF = phiF + abs(Af)*sin(angle(Af));
            Freqs(p) = Freq + ka*fm*cos(2*pi*fm*t1 + phif);
            ROCOFs(p) = -ka*fm^2*sin(2*pi*fm*t1 + phif);
            Ain(p) = abs(AF)*MagCorr(p);
            Theta(p) = phiF + DelayCorr(p)*1e-9*wF;
            iterations(p) = k;
        end
        Synx = (Ain/sqrt(2).*exp(1i.*Theta)).';
    end
end % if Km > 0.2



%Calculating symmetrical components
alfa = exp(2*pi*1i/3);
Ai = (1/3)*[1 1 1; 1 alfa alfa^2; 1 alfa^2 alfa];
Vabc = Synx(1:3,:);
Iabc = Synx(4:6,:);
Vzpn = Ai*Vabc; %voltage: zero, positive and negative
Izpn = Ai*Iabc;

%Synx output:
Synx = [ Vabc.' Vzpn(2) Iabc.' Izpn(2)];

%Freq and ROCOF outputs:
Freq = mean(Freqs(1:3));
ROCOF = mean(ROCOFs(1:3));



% % local function to get the values of SignalParams
%     function [varargout] = getParamIndex(signalparams)
%         for i = 1:nargout
%             varargout{i}=signalparams(i,:);
%         end
%     end
% 


end
