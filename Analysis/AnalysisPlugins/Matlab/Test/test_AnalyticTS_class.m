% Class-based unit testing for AnalyticTS_class
%
%   run these tests with two command-line commands:
%   - testCase = test_AnalyticTS_class;
%   - res = run(testCase);
%   OR
%   - res = testCase.run

classdef test_AnalyticTS_class < matlab.unittest.TestCase
    
    properties
        fig = 1; % figure numbers
        TS
    end
    
    methods (TestClassSetup)
        function constructTS (testCase)
            %testCase.TS = AnalyticTS_class;
        end
    end
    
   methods (TestMethodTeardown)
        
   end
    
    methods (Test)
        
        function regressionTests (testCase)
            testDefault(testCase); testCase.fig = testCase.fig+1;
            test_13_Harmonics(testCase); testCase.fig = testCase.fig+1;
            test_13_Harmonics_180(testCase); testCase.fig = testCase.fig+1;
            testCase = testPhaseStep(testCase); testCase.fig = testCase.fig+1;
            testCase = testMagDropAndRestore(testCase); testCase.fig = testCase.fig+1;
            testCase = testBandLimitedNoise(testCase); testCase.fig = testCase.fig+1;
            testCase = testFrequencyRamp(testCase); testCase.fig = testCase.fig+1;
        end
    end
  
    % These are the regression tests
    methods (Access=private)
        function testDefault(testCase)
            testCase.TS = AnalyticTS_class;            
            testCase.TS.Ts.Name = 'testDefault';
            disp(testCase.TS.Ts.Name)
            figure(testCase.fig)
            plot(real(testCase.TS.Ts.Data))
        end
        
        function testCase = testPhaseStep (testCase)
            testCase.TS.SettlingTime = 1.0;
            testCase.TS.T0 = 0.5;
            testCase.TS.Duration = 3;
            [~,Fin,~,~,~,~,~,~,~,~,~,KaS,KxS]  = testCase.TS.getParamIndex;
            testCase.TS.SignalParams(KxS,:) = .1;
            testCase.TS = testCase.TS.AnalyticWaveforms();
            plot(real(testCase.TS.Ts.Data))
            hold on
            testCase.TS.SettlingTime = 1.0 - .1/testCase.TS.SignalParams(Fin,1);
            testCase.TS = testCase.TS.AnalyticWaveforms();
            figure(testCase.fig)            
            plot(real(testCase.TS.Ts.Data))
            hold off
            
        end
        
        function testCase = testMagDropAndRestore (testCase)
            % A special test for frequency calibration, when magnitude drops to 0, the frequency returns to a different value
            testCase.TS.SettlingTime = 1.0;
            testCase.TS.T0 = 0.5;
            testCase.TS.Duration = 3;
            [~,~,~,~,~,~,~,~,~,~,~,~,KxS,KfS]  = testCase.TS.getParamIndex;
            testCase.TS.SignalParams(KxS,:) = -1;
            testCase.TS.SignalParams(KfS,:) = 50;
            testCase.TS = testCase.TS.AnalyticWaveforms();
            figure(testCase.fig)
            plot(real(testCase.TS.Ts.Data))
        end

        function test_13_Harmonics(testCase)
            F0 = 50;
            
            SignalParams = zeros(4+(12*3)+1,3);
            SignalParams(1,:) = 1;   % Xm
            SignalParams(2,:) = F0;   % Fin
            SignalParams(3,:) = [0 -120 120];    % Ps
            SignalParams(4,:) = -1;   % delimiter
            mags = [2.0,5.0,1.0,6.0,0.5,5.0,0.5,1.5,0.5,3.5,0.5,3.0];
            for i = 1:12
                SignalParams(5+((i-1)*3),:) = F0*(i+1);
                SignalParams(6+((i-1)*3),:) = 0;
                SignalParams(7+((i-1)*3),:) = mags(i)/100;
            end
            SignalParams(4+(12*3)+1,:) = -1;  % delimiter
            
            % instantiate the AnalyticTS class with these parameters
            testCase.TS = AnalyticTS_class(...
                'SignalParams',SignalParams,...
                'SampleRate', 50000,...
                'F0', F0...
                );
            
            figure(testCase.fig), testCase.fig=testCase.fig+1;
            grid on
            plot(real(testCase.TS.Ts.Data))
            
            % now get 50 windows and look at the expected values
            
            figure(testCase.fig), testCase.fig=testCase.fig+1;                        
            window = testCase.TS.getWindow(i-1,6,'odd');
            plot(real(window.Data))
            disp(window.UserData.Vals)
            disp(window.UserData.Freqs)
            disp(window.UserData.ROCOFs)                     
        end

        function test_13_Harmonics_180(testCase)
            F0 = 50;
            SignalParams = zeros(4+(12*3)+1,3);
            SignalParams(1,:) = 1;   % Xm
            SignalParams(2,:) = F0;   % Fin
            SignalParams(3,:) = [0 -120 120];    % Ps
            SignalParams(4,:) = -1;   % delimiter
            mags = [2.0,5.0,1.0,6.0,0.5,5.0,0.5,1.5,0.5,3.5,0.5,3.0];
            for i = 1:12
                SignalParams(5+((i-1)*3),:) = F0*(i+1);
                SignalParams(6+((i-1)*3),:) = 180;
                SignalParams(7+((i-1)*3),:) = mags(i)/100;
            end
            SignalParams(4+(12*3)+1,:) = -1;  % delimiter
            
            % instantiate the AnalyticTS class with these parameters
            testCase.TS = AnalyticTS_class('SignalParams',SignalParams);
            
            figure(testCase.fig)
            grid on
            plot(real(testCase.TS.Ts.Data))
        end            
        
        function testCase = testBandLimitedNoise (testCase)
            testCase.TS = AnalyticTS_class; 
            testCase.TS.Duration = 2;
            testCase.TS.SettlingTime = 1;
            [~,~,~,~,~,~,~,~,~,~,~,~,~,~,~,Kn,Fn]   = testCase.TS.getParamIndex;
            testCase.TS.SignalParams(Kn,:) = 0.03;
            testCase.TS.SignalParams(Fn,:) = 2000;
            testCase.TS = testCase.TS.AnalyticWaveforms();
            figure(testCase.fig)
            plot(testCase.TS.Ts.Time,real(testCase.TS.Ts.Data))
        end
        
        function testCase = testFrequencyRamp (testCase)
            testCase.TS = AnalyticTS_class; 
            [~,Fin,~,~,~,~,~,~,~,~,Rf]   = testCase.TS.getParamIndex;
            rampRng = 5;  % the range over wich to ramp
            testCase.TS.SignalParams(Fin,:) = 50;   % initial frequency
            testCase.TS.SignalParams(Rf,:) = 0.5;
            testCase.TS.SettlingTime = 0.5;
            testCase.TS.T0 = rampRng/testCase.TS.SignalParams(Rf,:);
            testCase.TS.Duration = testCase.TS.SettlingTime + 2*testCase.TS.T0;
            testCase.TS = testCase.TS.AnalyticWaveforms();
            figure(testCase.fig)
            plot(testCase.TS.Ts.Time,real(testCase.TS.Ts.Data))            
        end
        
    end
   
end

