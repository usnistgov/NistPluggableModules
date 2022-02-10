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
        fig = 1;
    end
    
    
%% Static method to get indexes into the signalParams matrix    
    methods(Static)
        % returns Xm=1;Fin=2;Ps=3;Fh=4;Ph=5;Kh=6;Fa=7;Ka=8;Fx=9;Kx=10;Rf=11;KaS=12;KxS=13;KfS=14;KrS=15
        % where variables after Ps are variable output arguments
        function [Xm, Fin, Ps, varargout] = getParamIndex()
            Xm=1;Fin=2;Ps=3;
            for i = 1:nargout-3
                varargout{i}=i+3;
            end
        end
    end
    
%% Setting up the test methods        
    methods (TestMethodSetup)
        function setDefaults(testCase)
            testCase.t0 = 0;
            testCase.Fs = 4800;
            testCase.SettlingTime=0;
            testCase.sizeMax = testCase.Fs * 10;    % 10 seconds max
            
            NPhases = 3;
            testCase.signalParams = zeros(15,NPhases);
            [Xm, Fin, Ps] = testCase.getParamIndex();
            
            testCase.signalParams(Xm,:) = 1;
            testCase.signalParams(Fin,:) = [50,50,50];
            testCase.signalParams(Ps,:) = [0,-120,120];
        end           
    end
    
 %%   res = run(testCase) runs the below
 methods (Test)
     function regressionTests (testCase)
         %testDefault(testCase); testCase.fig = testCase.fig + 1;
         %test_50f1(testCase); testCase.fig = testCase.fig + 1;
         %test_50f0_75i0(testCase); testCase.fig = testCase.fig + 1;
         %test_45f2(testCase); testCase.fig = testCase.fig+1;
         %setDefaults(testCase); testCase.fig = testCase.fig + 1;
         %test_70f0(testCase); testCase.fig = testCase.fig + 1;
         %test_ampl_step(testCase); testCase.fig = testCase.fig + 1;
         %test_freq_step(testCase); testCase.fig = testCase.fig + 1;
         %test_ramp(testCase); testCase.fig = testCase.fig + 1;
         %test_rocof_step(testCase); testCase.fig = testCase.fig + 1;
         %test_ampl_modulation(testCase); testCase.fig = testCase.fig + 1;
         test_13_harmonics(testCase); testCase.fig = testCase.fig + 1;

     end
 end
 
    
%%  These are the regression tests and the single test runner "runOnce  
    methods (Access=private)
        
        function runOnce(testCase)
            [Signal,size] = Waveforms(...
                testCase.t0,...
                testCase.SettlingTime,...
                testCase.sizeMax,...
                testCase.Fs,...
                testCase.signalParams...
                );
            
            %t = testCase.t0-testCase.SettlingTime:1/testCase.Fs:((size-1)/testCase.Fs)+testCase.t0+testCase.SettlingTime;
            t = -testCase.SettlingTime:1/testCase.Fs:((size-1)/testCase.Fs)+testCase.SettlingTime;
            
            plot(t,Signal(:,:))
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
               
        function test_45f2(testCase)
            setDefaults(testCase)
            [Xm Fin Ps] = testCase.getParamIndex();            
            testCase.Fs = 50000;
            testCase.sizeMax = 500000;
            testCase.signalParams(Xm,:) = 70;
            testCase.signalParams(Fin,:) = 45.2;
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
            saveWaveforms(testCase,Signal,size);            
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
           [~, Fin, ~, ~, ~, ~, ~, ~, ~, ~, Rf] = testCase.getParamIndex();
           testCase.sizeMax = testCase.Fs * 10;     % 10 seconds max size
           testCase.SettlingTime = 1;             % 1 second of settling on each side of the ramp
           testCase.signalParams(Fin,:)= 45.0;
           testCase.signalParams(Rf,:) = 1;
           runOnce(testCase);
        end
        
         function test_rocof_step(testCase)
           setDefaults(testCase);
           [~, Fin, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KrS] = testCase.getParamIndex();
           testCase.sizeMax = testCase.Fs * 1;     % 10 seconds max size
           testCase.SettlingTime = 1;             % 1 second of settling on each side of the ramp
           testCase.signalParams(Fin,:)= 45.0;
           testCase.signalParams(KrS,:) = 100;
           runOnce(testCase);
         end
        
         function test_freq_step(testCase)
           setDefaults(testCase);
           [~, Fin, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KfS, ~] = testCase.getParamIndex();
           F0 = 50;
           testCase.Fs = 4800;
           testCase.sizeMax = testCase.Fs * 3;     % 10 seconds max size
           testCase.SettlingTime = 14/F0;             % 1 second of settling on each side of the ramp
           testCase.signalParams(Fin,:)= F0-2.5;
           testCase.signalParams(KfS,:) = 5;
           testCase.t0 = 1 + 6*(0.1/F0);        % step occurs at .6 of a reporting interval 
           runOnce(testCase);
         end   
        
         function test_ampl_modulation(testCase)
             setDefaults(testCase)
             [~, Fin, ~, ~, ~, ~, ~, ~, Fx, Kx, ~, ~, ~, ~, ~] = testCase.getParamIndex();
             testCase.signalParams(Fx,:) = 1;
             testCase.signalParams(Kx,:) = 0.1;
             runOnce(testCase);
         end
         
         function test_13_harmonics(testCase)
             F0 = 50;
             setDefaults(testCase)
             testCase.signalParams = zeros(4+(12*3)+1,2);
             testCase.signalParams(1,:) = 70;   % Xm
             testCase.signalParams(2,:) = F0;   % Fin
             testCase.signalParams(3,:) = [0,-120];    % Ps
             testCase.signalParams(4,:) = -1;   % delimiter
             mags = [2.0,5.0,1.0,6.0,0.5,5.0,1.5,0.5,3.5,0.5,3.0,10.7];
             for i = 1:12
                 testCase.signalParams(5+((i-1)*3),:) = F0*(i+1);
                 testCase.signalParams(6+((i-1)*3),:) = [0,-120];
                 testCase.signalParams(7+((i-1)*3),:) = mags(i)/100;
             end
             testCase.signalParams(4+(12*3)+1,:) = -1;  % delimiter
             runOnce(testCase);
             
         end

        
        function saveWaveforms(testCase,Signal,size)
            % cd to the working directory
            cd (fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output','45f2'))
            
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