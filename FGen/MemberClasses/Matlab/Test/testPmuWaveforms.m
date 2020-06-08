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
    
   methods(Static)
        function [Xm Fin Ps Fh Ph Kh Fa Ka Fx Kx Rf KaS KxS] = getParamIndex()
            Xm=1;Fin=2;Ps=3;Fh=4;Ph=5;Kh=6;Fa=7;Ka=8;Fx=9;Kx=10;Rf=11;KaS=12;KxS=13;
        end
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
            %test_70f0(testCase);
            test_ampl_step(testCase);
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
            
            %t = linspace(0,size/testCase.Fs,size);
            t = testCase.t0-testCase.SettlingTime:1/testCase.Fs:((size-1)/testCase.Fs)+testCase.t0+testCase.SettlingTime;
            
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
        
        %est an amplitude step (50 Hz, 1 second + 7 cycle settling time)
        function test_ampl_step(testCase)
            setDefaults(testCase)
            [Xm Fin Ps Fh Ph Kh Fa Ka Fx Kx Rf KaS KxS] = testCase.getParamIndex();
            testCase.Fs = 48000;
            testCase.t0=-1;
            testCase.sizeMax = testCase.Fs*2;
            testCase.SettlingTime = 7/testCase.signalParams(Fin,1);
            testCase.signalParams(KxS,:) = 0.1*testCase.signalParams(Xm,:);
            runOnce(testCase);
        end
            
            
    end
    
 end