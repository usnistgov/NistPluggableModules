function Result = CorrFactor(Freq,Synx,Vin,MagCorr,PhaseRange)
Phase = linspace(PhaseRange(1),PhaseRange(2),PhaseRange(2)-PhaseRange(1)+1);
for i = PhaseRange(1):PhaseRange(2)
    Result(1,i) = Freq;	
    Result(2,i) = MagCorr(i);  % previous MagCorr
    Err = Vin(1)-abs(Synx(i));  % difference between 3458 value and 4-p fit value
    Result(3,i) = (Err/(Vin(1)+Err))*MagCorr(i);  % change in MagCorr
    Result(4,i) = MagCorr(i)+Result(3,i); % next MagCorr    
end
end