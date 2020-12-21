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
        fig = 0;
    end
    
    
%% Static method to get indexes into the signalParams matrix    
    methods(Static)
        function [Xm Fin Ps Fh Ph Kh Fa Ka Fx Kx Rf KaS KxS] = getParamIndex()
            Xm=1;Fin=2;Ps=3;Fh=4;Ph=5;Kh=6;Fa=7;Ka=8;Fx=9;Kx=10;Rf=11;KaS=12;KxS=13;
        end
    end
    
%% Setting up the test methods        
    methods (TestMethodSetup)
        function setDefaults(testCase)
            testCase.t0 = 0;
            testCase.Fs = 4800;
            testCase.SettlingTime=0;
            testCase.sizeMax = 48000;
            
            NPhases = 3;
            testCase.signalParams = zeros(13,NPhases);
            [Xm Fin Ps Fh Ph Kh Fa Ka Fx Kx Rf KaS KxS] = testCase.getParamIndex();
            
            testCase.signalParams(Xm,:) = 1;
            testCase.signalParams(Fin,:) = [50,50,50];
            testCase.signalParams(Ps,:) = [0,-120,120];
        end           
    end
    
 %%   res = run(testCase) runs the below
 methods (Test)
     function regressionTests (testCase)
         testCase.fig = testCase.fig + 1;
         %testDefault(testCase); testCase.fig = testCase.fig + 1;
         %test_50f1(testCase); testCase.fig = testCase.fig + 1;
         %test_50f0_75i0(testCase); testCase.fig = testCase.fig + 1;
         %setDefaults(testCase); testCase.fig = testCase.fig + 1;
         %test_70f0(testCase); testCase.fig = testCase.fig + 1;
         test_ampl_step(testCase); testCase.fig = testCase.fig + 1;
         %test_ramp(testCase); testCase.fig = testCase.fig + 1;
     end
 end
 
    
%%  These are the regression tests and the single test runner "runOnce  
    methods (Access=private)
        
        function runOnce(testCase)
            [Signal,size] = PmuWaveforms(...
                testCase.t0,...
                testCase.SettlingTime,...
                testCase.sizeMax,...
                testCase.Fs,...
                testCase.signalParams...
                );
            
            %t = testCase.t0-testCase.SettlingTime:1/testCase.Fs:((size-1)/testCase.Fs)+testCase.t0+testCase.SettlingTime;
            t = -testCase.SettlingTime:1/testCase.Fs:((size-1)/testCase.Fs)+testCase.SettlingTime;
            
            plot(t,Signal(1,:))
            % saveWaveforms(testCase,Signal,size);
        end
        
        function testDefault(testCase)
            runOnce(testCase)
        end
        
        function test_50f1(testCase)
            testCase.signalParams(2,:)= 50.1;
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
            testCase.Fs = 4800;
            testCase.t0=0.01;
            testCase.sizeMax = testCase.Fs*2;
            testCase.SettlingTime = 1;
            testCase.signalParams(KxS,:) = 0.1;
            runOnce(testCase);
        end
        
        function test_ramp(testCase)
           setDefaults(testCase);
           [Xm Fin Ps Fh Ph Kh Fa Ka Fx Kx Rf KaS KxS] = testCase.getParamIndex();
           testCase.Fs = 4800;
           testCase.sizeMax = testCase.Fs * 10;     % 10 seconds max size
           testCase.SettlingTime = 0.005;             % 1 second of settling on each side of the ramp
           testCase.signalParams(Fin,:)= 50.0;
           testCase.signalParams(Rf,:) = 0;
           runOnce(testCase);
        end
        
        function saveWaveforms(testCase,Signal,size)
            % cd to the working directory
            cd (fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output','step test'))
            
            % get the time to use as a file name
            P.Timestamp = now();
            t = datetime;
            v = datevec(t);
            name = strcat(num2str(v(1)), ...
                num2str(v(2),'%02.f'), ...
                num2str(v(3),'%02.f'), ...
                num2str(v(4),'%02.f'), ...
                num2str(v(5),'%02.f'), ...
                num2str(v(6),'%02.f'), ...
                '.mat');
        
            % Set up the storage structure
            P.Y = Signal;
            P.dt = 1/testCase.Fs;
            P.ActualPts = size;
            
            % Save it
            save(name,'P');
        

        end
            
            
    end
    
 end