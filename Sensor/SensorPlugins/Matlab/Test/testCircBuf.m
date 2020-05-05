classdef testCircBuf < matlab.unittest.TestCase
% Class-based unit testing for cicrcular buffer class
%
%   run these tests with two command-line commands:
%   >> testCase = testCircBuf;
%   >> res = run(testCase);

    properties
        Fs
        size
        t
        X
    end
    
    % Test Method Setup
    methods (TestMethodSetup)
        function setDefaults (testCase)
            Freq = 50;
            testCase.Fs = 800;
            testCase.size = 800/Freq;     % one cycle of Freq
            testCase.t = linspace(0,1,testCase.size)/Freq;
            testCase.t = testCase.t(1:end-1);
            testCase.X = cos(2*pi*Freq*testCase.t);
        end
    end
    
    % Method Block to contain test methods
    methods (Test)
        function regressionTests (testCase)
            Y = circBuf(testCase.X);
            plot(Y(1:30));  % one cycle is in the buffer, plotting 2 cycles
        end
    end
end
        
        