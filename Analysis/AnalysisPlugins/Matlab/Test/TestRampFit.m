classdef TestRampFit < matlab.unittest.TestCase
% Class-based unit testing for ramp fitter
%
%   run these tests with two command-line commands:
%   >> testCase = TestRampFit;
%   >> res = run(testCase);
%   
    
    properties
        Name    % Test name
        TS      %Time series to be analysed
        exp     %expected values
        SignalParams    % Parameters input to PmuTestSignals
        N       % signal size
        t0      % signal start time
        SettlingTime
        Fs      % sample rate
        X       % signal vectors
    end
    
% % Signal params.  Note that the labeling convention comes mostly from the
% % standard
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
    
    
    
    
    % Test Methods
    methods (Test)
        function regressionTests (testCase) 
            setTsDefaults(testCase)
            %testArt (testCase)
            %testLab (testCase)
            %testCapture (testCase)
            testSignal (testCase)
        end
    end
    
    
    %----------------------------------------------------------------------
    methods (Access = private)
        function testConstructor (testCase)
        end
        
        function setTsDefaults(testCase)
            testCase.Name = 'Default';
            testCase.N = 96; % size of the time series (3 cycles of F0 = 50)
            testCase.t0 = 0; % beginning of the time series
            testCase.Fs = 4800;
            testCase.SignalParams = zeros (13,6);
            testCase.SignalParams(1,:) = 1;
            testCase.SignalParams(2,:) = 50;
            testCase.SignalParams(3,:) = [0,-120,120,0,-120,120];
            testCase.SignalParams(11,:) = 1;
        end
        
        %======================================
        % One of the series of tests
        function testOne(testCase)
            testCase.X = PmuTestSignals (...
                testCase.t0,...
                testCase.SettlingTime, ...
                testCase.N, ...
                testCase.Fs,...
                testCase.SignalParams...
                );
            t = testCase.t0-testCase.SettlingTime:1/testCase.Fs:((testCase.N-1)/testCase.Fs)+testCase.t0+testCase.SettlingTime;
            figure(1)
            plot(t,testCase.X(1,:))
            
%             SignalParams = [testCase.TS.f0 testCase.TS.df];
%             SampleRate = 1/testCase.TS.dt;
%             Samples = real(testCase.TS.TS);
%             MagCorr = 1;        %Unused (for now)
%             DelayCorr = 0;      %Unused (for now)
%             F0 = 0;             %Unused
%             AnalysisCycles=0;   %Unused
%             
%                         
%             [Synx,Freq,ROCOF,iterations] = RampFit(...
%                 SignalParams,...
%                 DelayCorr, ...
%                 MagCorr, ...
%                 F0, ...
%                 AnalysisCycles, ...
%                 SampleRate, ...
%                 Samples ...
%                 );
%             act = [abs(Synx),Freq,ROCOF];
%             
%             disp(testCase.TS.Name)            
%             msg = sprintf('actual: %f %f %f %f',act);
%             disp(msg);
%             msg = sprintf('expected: %f %f %f %f',testCase.exp);
%             disp(msg);
%             
            %testCase.verifyEqual(act,testCase.exp,'AbsTol',0.001)
            %pause;
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
            path = 'C:\Users\PowerLabNI3\Documents\PMUCAL\Output\';
            name = 'SavedRamp.mat';
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
               
                   
               
               [Synx,Freq,ROCOF,iterations] = RampFit ( ...
                   SignalParams, ...
                   DelayCorr, ...
                   MagCorr, ...
                   F0, ...
                   AnalysisCycles, ...
                   SampleRate, ...
                   Samples ...
                   )
               pause
               
            end

        end
        
        %--------------------------------
        % test the signal generator
        function testSignal (testCase)
            testCase.N = 48000;     % 10 seconds
            testCase.SettlingTime = 2;
            testCase.SignalParams(2,:) = 1;
            %testCase.t0 = -1;
            testOne (testCase)
        end
            

    end
    
end


