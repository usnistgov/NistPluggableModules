classdef TestRampFit < matlab.unittest.TestCase
% Class-based unit testing for ramp fitter
%
%   run these tests with two command-line commands:
%   >> testCase = TestRampFit;
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
        
        MagCorr
        DelayCorr
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
    methods(Static)
        function [Xm,Fin,Ps,Fh,Ph,Kh,Fa,Ka,Fx,Kx,Rf,KaS,KxS] = getParamIndex()
            Xm=1;Fin=2;Ps=3;Fh=4;Ph=5;Kh=6;Fa=7;Ka=8;Fx=9;Kx=10;Rf=11;KaS=12;KxS=13;
        end
    end
          
%% Test Methods
    methods (Test)
        function regressionTests (testCase) 
            %testArt (testCase)
            %testLab (testCase)
            testCapture (testCase)
            %testDefaults (testCase)
        end
    end
    
    
%% Private Methods
    methods (Access = private)
        
        function setDefaults(testCase)
            testCase.F0 = 50;
            testCase.t0 = 0; % beginning of the time series
            testCase.Fs =48000;
            testCase.SettlingTime = 1.0;
            testCase.sizeMax = testCase.Fs * 10;
            testCase.AnalysisCycles = 6;
            
            
            testCase.SignalParams = zeros (13,6);
            [Xm,Fin,Ps,Fh,Ph,Kh,Fa,Ka,Fx,Kx,Rf,KaS,KxS] = testCase.getParamIndex();
            
            testCase.SignalParams(Xm,:) = [70, 70, 70, 5, 5, 5];
            testCase.SignalParams(Fin,:) = 45;
            testCase.SignalParams(Ps,:) = [0,-120,120,0,-120,120];
            testCase.SignalParams(Rf,:) = 1;
            
            testCase.MagCorr = [21.000557, 21.000932, 21.000614, 10.00427, 10.00351, 10.00485];        %Unused (for now)
            testCase.DelayCorr = [1501, 1555, 1926, 482, 506, 534];      %Unused (for now)
            
        end
        
        %======================================
        % One of the series of tests
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
                
                [Synx,Freq,ROCOF,iterations] = RampFit(...
                    testCase.SignalParams,...
                    testCase.DelayCorr, ...
                    testCase.MagCorr, ...
                    testCase.F0, ...
                    testCase.AnalysisCycles, ...
                    testCase.Fs, ...
                    Y ...
                    );
                act(i+1,:) = {Synx;Freq;ROCOF;iterations};
                 idx = idx + sampPerCyc;
            end
           
            
            
        end
        
        %-------------------------------
        function testLab (testCase)
            testCase.TS.Name = 'Test 50Hz, 1 Hz/sec t0=0';
            testCase.TS.N = 96*3;
            testCase.TS.t0 = 0;
            testCase.TS.dt = 1/4800;
            testCase.TS.f0 = 50;
            testCase.TS.df = 1;
            testCase.TS.phi0 = 0;
            testCase.exp = [1/sqrt(2), 50, 1];
            testOne (testCase);
        
        end
        %--------------------------------
        function testCapture (testCase)
            path = fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output','SavedWindow.mat');            
            A = open(path);
            P = A.P;
            clear A;
            
            testCase.setDefaults()  % the defaults need to be set up for the data capture
            
            for i = 1:length(P)
               Samples = P(i).Window;
               if isempty(Samples); continue; end;
               
                   
               
               [Synx,Freq,ROCOF,iterations] = RampFit ( ...
                   testCase.SignalParams, ...
                   testCase.DelayCorr, ...
                   testCase.MagCorr, ...
                   testCase.F0, ...
                   testCase.AnalysisCycles, ...
                   testCase.Fs, ...
                   Samples ...
                   )
               %pause
               
            end

        end
        
        %--------------------------------
        % test the signal generator
        function testDefaults (testCase)
            setDefaults (testCase);
            testOne (testCase)
        end
            

    end
    
end


