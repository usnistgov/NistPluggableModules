classdef TestStepFit < matlab.unittest.TestCase
% Class-based unit testing for ramp fitter
%
%   run these tests with two command-line commands:
%   >> testCase = TestStepFit;
%   >> res = run(testCase);
%   
    
    properties
        Name    % Test name
        TS              % Time series to be analysed
        exp             % expected values
        signalParams    % Parameters input to PmuTestSignals
        sizeMax         % signal size
        t0              % signal start time
        SettlingTime
        Fs              % sample rate
        F0              % Noinal Frequency
        AnalysisCycles  % number of nominal cycles to be analysed by the fitter
        X               % signal vectors
        MagCorr         % Magnitude Correction Valuse
        DelayCorr       % Delay Correction Values
    end
    
% % Signal params.  Note that the labeling convention comes mostly from the
% % standard
%     Xm = signalParams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
%     Fin = signalParams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
%     Ps = signalParams(3,:);     % phase 
%     Fh = signalParams(4,:);     % Frequency of the interfering signal
%     Ph = signalParams(5,:);     % Phase of the interfering signal
%     Kh = signalParams(6,:);     % index of the interfering signal    
%     Fa = signalParams(7,:);     % phase (angle) moduation frequency
%     Ka = signalParams(8,:);     % phase (angle) moduation index
%     Fx = signalParams(9,:);     % amplitude moduation frequency
%     Kx = signalParams(10,:);    % amplitude moduation index
%     Rf = signalParams(11,:);    % ROCOF
%     KaS = signalParams(12,:);   % phase (angle) step index
%     KxS = signalParams(13,:);   % magnitude step index
  

    % Test Methods
    methods (Test)
        function regressionTests (testCase) 
            
            setTsDefaults(testCase)
            runOnce(testCase)
            %testArt (testCase)
            %testLab (testCase)
            %testCapture (testCase)
            %testSignal (testCase)
        end
    end


    methods (Access = private)
        function testConstructor (testCase)
        end
        
        function setTsDefaults(testCase)
            
            [Xm, Fin, Ps, Fh, Ph, Kh, Fa, Ka, Fx, Kx, Rf, KaS, KxS] = testCase.getParamIndex();
            
            testCase.AnalysisCycles = 5;
            NPhases = 3; % Number of phases to analyse
            
            testCase.Name = 'Amplitude Step';
            testCase.t0 = -1; % beginning of the time series
            testCase.Fs = 48000;
            testCase.F0 = 50;
            testCase.sizeMax = testCase.Fs*2; % size of the time series (3 cycles of F0 = 50)
            testCase.MagCorr = ones(1,NPhases);
            testCase.DelayCorr = zeros(1,NPhases);
            
            % signal parameters
            testCase.signalParams = zeros (13,NPhases);
            testCase.signalParams(Xm,:) = 1;
            testCase.signalParams(Fin,:) = 50;
            testCase.signalParams(Ps,:) = [0,-120,120];
            testCase.signalParams(KxS,:) = 0.1*testCase.signalParams(Xm,:);
            
            testCase.SettlingTime = 7/testCase.signalParams(Fin,1);
           
        end
        
%%       Runs one iteration of a test case        
        function runOnce(testCase)
            [Signal,size] = PmuWaveforms(...
                testCase.t0,...
                testCase.SettlingTime,...
                testCase.sizeMax,...
                testCase.Fs,...
                testCase.signalParams...
                );
            
            % total time vector
            t = testCase.t0-testCase.SettlingTime:1/testCase.Fs:((size-1)/testCase.Fs)+testCase.t0+testCase.SettlingTime;
            
            N = length(Signal);
            Nx = testCase.AnalysisCycles*testCase.Fs/testCase.F0;

            x = t(((N/2)-(Nx/2))+1:(N/2)+(Nx/2));           % windowed time vector
            Y = Signal(:,((N/2)-(Nx/2))+1:(N/2)+(Nx/2));    % windowed signal

            [~,~,~] = StepFit (...
                testCase.signalParams, ...
                testCase.DelayCorr, ...
                testCase.MagCorr, ...
                testCase.F0, ...
                testCase.AnalysisCycles, ...
                testCase.Fs, ...
                Y ...
                );
           
        end
        
        
    end
    
    methods(Static)
        function[Xm, Fin, Ps, Fh, Ph, Kh, Fa, Ka, Fx, Kx, Rf, KaS, KxS] = getParamIndex()
            Xm=1; Fin=2; Ps=3; Fh=4; Ph=5; Kh=6; Fa=7; Ka=8; Fx=9; Kx=10; Rf=11; KaS=12; KxS=13;
        end
             
    end
    
    
end
        
