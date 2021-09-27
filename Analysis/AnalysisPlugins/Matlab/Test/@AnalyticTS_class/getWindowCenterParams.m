function [Synx,Freq,ROCOF] = getWindowCenterParams(obj,offset,analysisCycles)
%GETPARAMS returns the calculated values of the analytic signal, frequency
%and ROCOF at the center of the window defined by offset and analysisCycles.
%   This will be used mainly to validate the parameters in the
%   Window.UserData output from the getWindows method.


[Xm,Fin,Ps,Fi,Pi,Ki,Fa,Ka,Fx,Kx,Rf,KaS,KxS,KfS,KrS] = obj.getParamVals(obj.SignalParams);

nPhases = length(Xm);

stepIdx = all([Rf; KaS; KxS; KfS; KrS]');
noSteps = all(stepIdx == 0);
Freqs = Fin(1,1);
if Ki(1) > 0; Freqs = [Freqs, Fh(1,1)]; end
if Ka(1) > 0; Freqs = [Freqs, Fa(1,1)]; end
if Kx(1) > 0; Freqs = [Freqs, Fx(1,1)]; end

% calculate the angular frequencies
Wf = 2*pi*Fin;  % fundamental frequency
Wa = 2*pi*Fa;   % phase (angle) modulation frequency
Wx = 2*pi*Fx;   % amplitude modulation frequency
Wi = 2*pi*Fi;

tc = ((analysisCycles/obj.F0)/2+(offset/obj.F0));  

% Amplitude: SS, AM, and Step
Ain = Xm.*(1+Kx.*cos(Wx*tc));
Ain(tc >= 0+obj.T0,:) = Ain(tc >= 0+obj.T0,:) .* (1 + KxS);


% Phase
Theta = Wf*tc + Ps*pi/180 ...
      - Ka.*cos(Wa*tc-pi); 
Freq = Fin + Ka.*Fa.*sin(Wa*tc-pi); 
ROCOF = Ka.*Fa.^2.*cos(Wa*tc-pi)*2*pi;
  
% Phase Step  
Theta(tc >= (0+obj.T0),:) = Theta(tc >= (0+obj.T0),:) + (KaS * pi/180);
       
%frequency ramp (ramp begins at obj.T0)
rampIdx = all([Rf; KrS]');
if all(Rf == 0); Rf = KrS; end  % prefer Rf over KrS

if ~(all(rampIdx == 0))
    if all(Rf == 0); Rf = KrS; end  % prefer Rf over KrS
    endRamp = obj.Duration;         % 
    if (tc>=(0+obj.T0) && tc<=endRamp)
        Theta(tc>=(0+obj.T0) & tc<=endRamp,:) = Theta(tc>=(0+obj.T0) & tc<=endRamp,:) + (pi*Rf*tc(tc>=(0+obj.T0) & tc<=endRamp).^2);
        Freq = Freq + Rf*(tc-obj.T0);
        ROCOF = Rf;
    elseif (tc>(endRamp+obj.T0))
        Theta(tc>(endRamp+obj.T0),:) = Theta(tc>(endRamp+obj.T0),:) + (pi*Rf.*(endRamp+obj.T0).*tc(tc>(endRamp+obj.T0)));
        Freq = Freq + RF*(endRamp-obj.T0);        
    end
end

%frequency step
if ~(all(KfS == 0))
        Theta(tc>=(0+obj.T0),:) = Theta(tc>=(0+obj.T0),:) + ((2*pi*KfS)*(tc(tc>=(0+obj.T0))-obj.T0)); 
        if (tc >= obj.T0)
            Freq = Freq + KfS;
        end
end

Synx = (Ain.*exp(1i.*Theta));

end

