classdef testAnnexDPmu < matlab.unittest.TestCase
% Class-based unit testing for simulated Annex D PMU
%
%   run these tests with two command-line commands:
%   >> testCase = testAnnexDPmu;
%   >> res = run(testCase);

    properties
        F0 = 50;
        Fs = 50;
        FSamp = 800;
        SettlingTime = .2;
        bPosSeq = true(1);
        WindowType = 'Hamming';
        FilterParams = [7.75,142];
        T0 = 0;
        Duration = 5.0;
        Signal;
    end
    
    % Test Method Setup
    methods (TestMethodSetup)
        function setDefaults (testCase)
            signalParams = zeros(13,3);
            signalParams(1,:) =  [70,70,70];     % phase amplitude (given by the user in RMS
            signalParams(2,:) = [50,50,50];      % frequency (must be the same for all 6 channels or an error will be thrown
            signalParams(3,:) = [0,-120,120];    % phase
            testCase.Signal = PmuWaveforms(...
                testCase.T0, ...
                0, ...                                  % SettlingTime
                testCase.Duration * testCase.FSamp, ... % Max size, duration of the test
                testCase.FSamp, ...
                signalParams);
        end
    end
    
    % Method Block to contain test methods
    methods (Test)
        function regressionTests (testCase)
           runOneTest (testCase)
        end
    end
    
    methods (Access = private) 
        function runOneTest (testCase)
            testCase.Signal = circBuf(testCase.Signal');
            [Timestamp,Synx,Freq,ROCOF]=AnnexDPmu(...
                testCase.Signal,...
                testCase.bPosSeq, ...
                testCase.FilterParams, ...
                testCase.WindowType, ...
                testCase.T0, ...
                testCase.F0, ...
                testCase.Fs, ...
                testCase.FSamp, ...
                testCase.SettlingTime,...
                testCase.Duration);
            plot(Timestamp,abs(Synx))
        end
        
    end
    
end

        
