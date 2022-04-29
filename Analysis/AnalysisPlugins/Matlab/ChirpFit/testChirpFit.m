classdef testChirpFit < matlab.unittest.TestCase
% Class-based unit testing for ramp fitter
%
%   run these tests with two command-line commands:
%   >> testCase = testChirpFit;
%   >> res = run(testCase);
%   
    
    properties
        Name    % Test name
        SignalParams    % Parameters input to PmuTestSignals
        F0
        t0              % signal start time
        AnalysisCycles
        SettlingTime
        sizeMax         % signal size
        Fs      % sample rate
        TS      %Time series to be analysed
        exp     %expected values        
    end
    
%% Signal params.  Note that the labeling convention comes mostly from the
%  standard
%     Xm = signalparams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
%     Fin = signalparams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
%     Ps = signalparams(3,:);     % phase 
%     Fh = signalparams(4,:);     % Frequency of the interfering signal
%     Ph = signalparams(5,:);     % Phase of the interfering signal
%     Kh = signalparams(6,:);     % index of the interfering signal    
%     Fa = signalparams(7,:);     % phase (angle) moduation frequency
%     Ka = signalparams(8,:);     % phase (angle) moduation index
%     Fx = signalparams(9,:);     % amplitude moduation frequency
%     Kx = signalparams(10,:);    % amplitude moduation index
%     Rf = signalparams(11,:);    % ROCOF
%     KaS = signalparams(12,:);   % phase (angle) step index
%     KxS = signalparams(13,:);   % magnitude step index
    
% Static method to get indexes into the signalParams matrix    
    methods (Static)
        function [Xm,Fin,Ps,Fh,Ph,Kh,Fa,Ka,Fx,Kx,Rf,KaS,KxS] = getParamIndex()
            Xm=1;Fin=2;Ps=3;Fh=4;Ph=5;Kh=6;Fa=7;Ka=8;Fx=9;Kx=10;Rf=11;KaS=12;KxS=13;
        end
    end
          
%% Test Methods
    methods (Test)
        function regressionTests (testCase) 
            %testDefaults (testCase)
            testLocate (testCase)
        end
    end
    
 %% Public Methods
 methods (Access = public)
     
     %--------------------------------
     % test the default chirp signal
     function testDefaults (testCase)
         setDefaults (testCase);
         testOne (testCase)
     end
     %--------------------------------
     
     function testLocate (testCase)
         
         setDefaults (testCase)       
         % settling time is the length of one window and the chirp if the
         % length of 2 windows
         testCase.SettlingTime = testCase.AnalysisCycles / testCase.F0;
         testCase.sizeMax = 2 * (testCase.AnalysisCycles / testCase.F0) * testCase.Fs;
         
         testCase.TS = PmuWaveforms (...
             testCase.t0,...
             testCase.SettlingTime, ...
             testCase.sizeMax, ...
             testCase.Fs,...
             testCase.SignalParams...
             );
         t = testCase.t0-testCase.SettlingTime:1/testCase.Fs:((testCase.sizeMax-1)/testCase.Fs)+testCase.t0+testCase.SettlingTime;
         %figure(1)
         %plot(t,testCase.TS(1,:))
         
         
         % Loop through the time series one cycle at a time and call the
         % ChirpStepLocate
         N = length(testCase.TS);
         dur = N/testCase.Fs;
         numReports = dur*testCase.F0;
         sampPerCyc = testCase.Fs/testCase.F0;
         winSize = ceil((testCase.AnalysisCycles / testCase.F0) * testCase.Fs);    %window size
         
         numPhases = size(testCase.TS,1);
         FrFT = zeros(winSize,numPhases);
         act = cell(numReports+1,1);
         act(1,:) = {'FrFT'};
         idx = 1;
         for i = 1:numReports
            Y =  testCase.TS(:,idx:idx+winSize-1);  
            %plot(Y(1,:));drawnow 
            
            % ----------experiment with the FrFT--------------------------
            for j = 1 : numPhases 
                [FrFT(:,i)] = frft(Y(1,:),0);
            end
            act(i+1,:) = {FrFT};     
            idx = idx + sampPerCyc;
            
         end
         
         
            
         
         
     end
          
 end
    
%% Private Methods
    methods (Access = private)
        
        %Defaults for a 10 second linear chirp, 45 Hz to 55 Hz with 1 second settling time at each end
        function setDefaults(testCase)
            testCase.F0 = 50;
            testCase.t0 = 0; % beginning of the time series
            testCase.Fs =4800;
            testCase.SettlingTime = 1.0;
            testCase.sizeMax = testCase.Fs * 10;
            testCase.AnalysisCycles = 6;
            
            
            testCase.SignalParams = zeros (13,6);
            [Xm,Fin,Ps,Fh,Ph,Kh,Fa,Ka,Fx,Kx,Rf,KaS,KxS] = testCase.getParamIndex();
            
            testCase.SignalParams(Xm,:) = 1;
            testCase.SignalParams(Fin,:) = 45;
            testCase.SignalParams(Ps,:) = [0,-120,120,0,-120,120];
            testCase.SignalParams(Rf,:) = 1;
        end    
       %======================================
        % Run one of the series of regression tests
        function testOne(testCase)
            testCase.TS = PmuWaveforms (...
                testCase.t0,...
                testCase.SettlingTime, ...
                testCase.sizeMax, ...
                testCase.Fs,...
                testCase.SignalParams...
                );
            t = testCase.t0-testCase.SettlingTime:1/testCase.Fs:((testCase.sizeMax-1)/testCase.Fs)+testCase.t0+testCase.SettlingTime;
            %figure(1)
            %plot(t,testCase.TS(1,:))
            
            
            MagCorr = [1,1,1,1,1,1,1];        %Unused (for now)
            DelayCorr = [0,0,0,0,0,0];      %Unused (for now)
            %
            % Loop through the time series and analyse AnalysisCycle windows
            N = length(testCase.TS);
            dur = N/testCase.Fs;
            numReports = dur*testCase.F0;      % assumes the reporting rate is equal to the nominal frequency
            sampPerCyc = testCase.Fs/testCase.F0;
            winSize = ceil((testCase.AnalysisCycles / testCase.F0) * testCase.Fs);    %window size
            act = cell(numReports-testCase.AnalysisCycles+1,4);
            act(1,:)={'Synx';'Freq';'ROCOF';'iterations'};
            %results = {numReports-testCase.AnalysisCycles};
            
            idx = 1;
            for i = 1 : numReports-testCase.AnalysisCycles
                %if idx+winSize-1 > N;break;end
                Y =  testCase.TS(:,idx:idx+winSize-1);  
                %plot(Y(1,:));drawnow    
                
                [Synx,Freq,ROCOF,iterations] = ChirpFit(...
                    testCase.SignalParams,...
                    DelayCorr, ...
                    MagCorr, ...
                    testCase.F0, ...
                    testCase.AnalysisCycles, ...
                    testCase.Fs, ...
                    Y ...
                    );
                act(i+1,:) = {Synx;Freq;ROCOF;iterations};
                 idx = idx + sampPerCyc;
            end
           
            
            
        end   
    end
end