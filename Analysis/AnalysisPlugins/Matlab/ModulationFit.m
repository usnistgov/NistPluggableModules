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

[~,Fin,~,~,~,~,Fa,Ka,Fx,Kx] = getParamVals(SignalParams);

% Combined modulation assumes the same modulation frequency
if Ka(1) == 0
    Fm = Fx; Km = Kx; %modulation frequency
else
    Fm = Fa;Km = Ka; %modulation frequency, amplitude
end
dt = 1/SampleRate;

[Synx,Freqs,ROCOFs, iterations] = ModFit2Sb(Fin,Fm,Km,Samples',dt,MagCorr,DelayCorr);

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



end
