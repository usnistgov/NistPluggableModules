clear all

path = 'C:\Users\PowerLabNI3\Documents\PMUCAL\Output\';
name = 'SavedFit.mat';
name = strcat(path,name);

A = open(name);
P = A.P;
clear A;

for i = 1:length(P)
    SignalParams = P(i).SignalParams;
    DelayCorr = P(i).DelayCorr;
    MagCorr = P(i).MagCorr;
    F0 = P(i).F0;
    AnalysisCycles = P(i).AnalysisCycles;
    SampleRate = P(i).SampleRate;
    Samples = P(i).Samples;
    
    
    [Synx,Freq,ROCOF] = SteadyStateFit ( ...
        SignalParams, ...
        DelayCorr, ...
        MagCorr, ...
        F0, ...
        AnalysisCycles, ...
        SampleRate, ...
        Samples ...
        );
    
end

