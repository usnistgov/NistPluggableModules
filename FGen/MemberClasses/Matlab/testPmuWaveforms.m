% Class-based unit testing for PmuWaveforms
%
%   run these tests with two command-line commands:
%   - testCase = testPmuWaveforms;
%   - res = run(testCase);
%
classdef testPmuWaveforms < matlab.unittest.TestCase
    properties
        t0
        SettlingTime
        Fs
        signalParams
        sizeMax
    end
        
    methods (TestMethodSetup)
        function setDefaults(testCase)
            testCase.t0 = 0;
            testCase.Fs = 100000;
            testCase.SettlingTime=0;
            testCase.sizeMax = 10000000;
            
            Xm = [1,1,1];
            Fin = [50,50,50];
            Ps = [0,-120,120];
            Fh = [0,0,0];
            Ph = [0,-120,120];
            Kh = [0,0,0];
            Fa = [0,0,0];
            Ka = [0,0,0];
            Fx = [0,0,0];
            Kx = [0,0,0];
            Rf = [0,0,0];
            Kas = [0,0,0];
            Kxs = [0,0,0];
            testCase.signalParams = [Xm;Fin;Ps;Fh;Ph;Kh;Fa;Ka;Fx;Kx;Rf;Kas;Kxs]; 
        end           
    end
    
    methods (Test)
        function regressionTests (testCase)
            %testDefault(testCase);
            %pause;
            %test_50f0_75i0(testCase);
            %setDefaults(testCase);
            test_70f0(testCase);
        end
    end
    
    methods (Access=private)
    % These private methods are called by the regression tests
    
        function runOnce(testCase)
           [Signal,size] = PmuWaveforms(...
                    testCase.t0,...
                    testCase.SettlingTime,...
                    testCase.sizeMax,...
                    testCase.Fs,...
                    testCase.signalParams...
                    );

                t = linspace(0,size/testCase.Fs,size);
            plot(t,Signal(1,:))          

                
        end
    
        function testDefault(testCase)
            runOnce(testCase)
        end
        
        function test_50f0_75i0(testCase)
            testCase.signalParams(4,:)=[75,75,75];
            testCase.signalParams(6,:) = [0.5,0.5,0.5];
            runOnce(testCase)
        end
        
        function test_70f0(testCase)
           testCase.signalParams(2,:)=[70,70,70];    % Fin
           testCase.signalParams(3,:)=[-90,-90,-90];
           runOnce(testCase);
        end
            
            
    end
end