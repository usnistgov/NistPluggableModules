function [Synx,Freqs,ROCOFs, iterations] = ModFit2Sb(Fin,Fm,Km,Samples,dt,MagCorr,DelayCorr)
%Fitter for modulated signals witn modulation index less than 0.3
%   Fits to a model with only 2 sidebands
% inputs:
%   Fin: Fundamental frequency
%   Fm: Modulation frequency
%   Km: Modulation Index
%   Samples: Rows of samples, columns of phases
%   dt = Sampling period (1/Sample Rate)

[NSamples,NPhases] = size(Samples);

% angular rotation
wF = 2*pi*Fin;  % fundamental frequency
wm = 2*pi*Fm;   % modulation frequency

% time vector
tn = linspace(-NSamples/2,NSamples/2-1,NSamples)*dt;

MaxIter = 40;
FitCrit = 1e-7;   %dFm min

% pre allocate results
Freqs = zeros(1,NPhases);
ROCOFs = zeros(1,NPhases);
Ain = zeros(1,NPhases);
Theta = zeros(1,NPhases);
iterations = zeros(1,NPhases);

% loop fits 2 sideband (1 lower and 1 upper) model
for p = 1:NPhases
    
    Af = complex(Km(p),0);
    
    for k = 1:MaxIter
        Afm = abs(Af); phif = angle(Af);
        %Fit sample data with model matrix
        H = [cos(wF(p)*tn + Afm*sin(wm(p)*tn + phif))', ...
            sin(wF(p)*tn + Afm*sin(wm(p)*tn + phif))', ...
            cos((wF(p)-wm(p))*tn + Afm*sin(wm(p)*tn + phif))', ...
            sin((wF(p)-wm(p))*tn + Afm*sin(wm(p)*tn + phif))', ...
            cos((wF(p)+wm(p))*tn + Afm*sin(wm(p)*tn + phif))', ...
            sin((wF(p)+wm(p))*tn + Afm*sin(wm(p)*tn + phif))', ...
            ones(1,NSamples)'];
        
        S = (H'*H)\(H'*Samples(:,p));
    
        %-------------- DEBUG -----------------------------------
%         % plot the model, original and the residual
%         fit = sum(S.*H',1);
%         figure(3)
%         subplot(2,1,1)
%         plot(tn,Samples(p,:));
%         hold on
%         plot(tn,fit')
%         hold off
%         subplot(2,1,2)
%         plot(tn,(Samples(p,:)-fit)')
%         %pause
        %-------------------------------------------------------------
        
        cF = complex(S(1),S(2)); AF = abs(cF); phiF = -angle(cF);
        cL = complex(S(3),S(4)); AL = abs(cL); phiL = -angle(cL);
        cU = complex(S(5),S(6)); AU = abs(cU); phiU = -angle(cU);
        
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
    AF = AF*(1+ma*cos(phia));
    phiF = phiF + abs(Af)*sin(angle(Af));
    Freqs(p) = Fin(p) + abs(Af)*Fm(p)*cos(angle(Af));
    ROCOFs(p) = -wm(p)^2*abs(Af)*sin(angle(Af))/(2*pi);
    Ain(p) = abs(AF)*MagCorr(p);
    Theta(p) = phiF + DelayCorr(p)*1e-9*wF(p);
    iterations(p) = k;   
end
Synx = (Ain/sqrt(2).*exp(1i.*Theta)).';

end

