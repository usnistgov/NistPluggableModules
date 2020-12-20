classdef TestStepFit < matlab.unittest.TestCase
% Class-based unit testing for ramp fitter
%
%   run these tests with two command-line commands:
%   >> testCase = TestStepFit;
%   >> res = run(testCase);
%   
%%    
    properties
        Name            % Test name
        exp             % expected values
        signalParams    % Parameters input to PmuTestSignals
        sizeMax         % signal size
        t0              % signal start time
        SettlingTime
        Fs              % sample rate
        F0              % Noinal Frequency
        AnalysisCycles  % number of nominal cycles to be analysed by the fitter
        stepOffset      % signed offset, (in seconds) from 0 where the step will occur
        Ignore          % percent of the beggining and end hilbert gradients that will be ignored by stepLocate
        MagCorr         % Magnitude Correction Valuse
        DelayCorr       % Delay Correction Values
    end
    
%%
%  Signal params.  Note that the labeling convention comes mostly from the PMU standard
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
%     KaS = signalParams(12,:);   % phase (angle) step index in degrees
%     KxS = signalParams(13,:);   % magnitude step index
    methods(Static)
        function[Xm, Fin, Ps, Fh, Ph, Kh, Fa, Ka, Fx, Kx, Rf, KaS, KxS] = getParamIndex()
            Xm=1; Fin=2; Ps=3; Fh=4; Ph=5; Kh=6; Fa=7; Ka=8; Fx=9; Kx=10; Rf=11; KaS=12; KxS=13;
        end

%       Get a waveform  
        function [x,Y] = getWaveform(testCase)
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
            Nx = (testCase.AnalysisCycles*testCase.Fs/testCase.F0);
            offset = (testCase.stepOffset*testCase.Fs);
            
            x = t(((N/2)-(Nx/2))+1:(N/2)+(Nx/2));           % windowed time vector
            Y = Signal(:,((N/2)-(Nx/2))-offset+1:(N/2)+(Nx/2)-offset);    % windowed signal
        end  
        
        function [Synx,Freq,Rocof]=getTestProperties(testCase,Props)
            testCase.signalParams=Props.SignalParams;
            testCase.DelayCorr=Props.DelayCorr;
            testCase.MagCorr=Props.MagCorr;
            testCase.F0=Props.F0;
            testCase.AnalysisCycles=Props.AnalysisCycles;
            testCase.Fs=Props.SampleRate;
            Y=Props.Samples;
            
            [Synx,Freq,Rocof] = StepFit (...
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
%% Constructor method (called when the testCase object is created)
    methods
        function testCase = TestStepFit()
            testCase.setDefaults;
        end
    end
%% Test Methods
%   The functions in this method list are run automatically when "res=run(testCase)" is called.
    methods (Test)
        function regressionTests (testCase)
%             testCase.test_LocateDefaultPosAmpl
%             testCase.test_LocateDefaultNegAmpl
%             testCase.test_LocateDefaultPosPhase
%             testCase.test_LocateDefaultNegPhase
%             testCase.test_LocatePosAmplSweep
%             testCase.test_LocateNegAmplSweep
%             testCase.test_LocatePosPhaseSweep
%             testCase.test_LocateNegPhaseSweep
%             testCase.test_FitDefaultPosAmpl
%             testCase.test_FitDefaultNegAmpl
%             testCase.test_FitDefaultPosPhase
%             testCase.test_FitDefaultNegPhase
%             testCase.test_FitPosAmplSweep
%             testCase.test_FitNegAmplSweep
%             testCase.test_FitPosPhaseSweep
%             testCase.test_FitNegPhaseSweep
%             testCase.test_FitPosAmplEarly
%             testCase.test_FitPosAmplLate
              testCase.test_CapturedStep

        end
    end

    %% Regression Tests (public so they can be called externally)
    methods(Access = public)
 
        function test_LocateDefaultPosAmpl(testCase)
        % test locating an amplitude step in the center of the window 
            testCase.Name='test_LocateDefaultPosAmpl';
            fprintf('\n%s\n',testCase.Name)
            testCase.setDefaults
            testCase.exp = [0,0,0];
            runOneLocate(testCase)            
        end

        function test_LocateDefaultNegAmpl(testCase)
        % test locating an amplitude step in the center of the window 
            testCase.setDefaults
            testCase.Name='test_LocateDefaultNegAmpl';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:)=-0.1;
            testCase.exp = [0,0,0];
            runOneLocate(testCase)            
        end

        function test_LocateDefaultPosPhase(testCase)
        % test locating an amplitude step in the center of the window    
            testCase.setDefaults
            testCase.Name='test_LocateDefaultPosPhase';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = 0;
            testCase.signalParams(KaS,:) = 10;
            testCase.exp = [0,0,0];
            runOneLocate(testCase)            
        end
         
        function test_LocateDefaultNegPhase(testCase)
        % test locating an amplitude step in the center of the window    
            testCase.setDefaults
            testCase.Name='test_LocateDefaultNegPhase';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = 0;
            testCase.signalParams(KaS,:) = -10;
            testCase.exp = [0,0,0];
            runOneLocate(testCase)            
        end        
        
        function test_LocatePosAmplSweep(testCase)
        % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
        % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_LocatePosAmplSweep';
            fprintf('\n%s\n',testCase.Name)
            testCase.stepOffset = -(0.5/testCase.F0);
             for i = 1:10
                testCase.exp = [testCase.stepOffset,testCase.stepOffset,testCase.stepOffset];
                runOneLocate(testCase)
                testCase.stepOffset = testCase.stepOffset + 0.1/testCase.F0;
            end
        end
        
       function test_LocateNegAmplSweep(testCase)
        % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
        % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_LocateNegAmplSweep';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = -0.1;
             testCase.stepOffset = -(0.5/testCase.F0);
             for i = 1:10
                testCase.exp = [testCase.stepOffset,testCase.stepOffset,testCase.stepOffset];
                runOneLocate(testCase)
                testCase.stepOffset = testCase.stepOffset + 0.1/testCase.F0;
            end
        end
        
        function test_LocatePosPhaseSweep(testCase)
            % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
            % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_LocatePosPhaseSweep';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = 0;
            testCase.signalParams(KaS,:) = 10;
            testCase.stepOffset = -(0.5/testCase.F0);
            for i = 1:10
                testCase.exp = [testCase.stepOffset,testCase.stepOffset,testCase.stepOffset];
                runOneLocate(testCase)
                testCase.stepOffset = testCase.stepOffset + 0.1/testCase.F0;
            end
        end
        
        function test_LocateNegPhaseSweep(testCase)
            % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
            % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_LocateNegPhaseSweep';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = 0;
            testCase.signalParams(KaS,:) = -10;
            testCase.stepOffset = -(0.5/testCase.F0);
            for i = 1:10
                testCase.exp = [testCase.stepOffset,testCase.stepOffset,testCase.stepOffset];
                runOneLocate(testCase)
                testCase.stepOffset = testCase.stepOffset + 0.1/testCase.F0;
            end
        end
        
            
        function test_FitDefaultPosAmpl(testCase)
        % test fitting an amplitude step in the center of the window    
            testCase.setDefaults            
            testCase.Name='test_FitDefaultPosAmpl';
            fprintf('\n%s\n',testCase.Name)
             testCase.fitOne  
        end
        
        function test_FitPosAmplEarly(testCase)
        % test fitting an amplitude step in the center of the window    
            testCase.setDefaults            
            testCase.Name='test_FitDefaultPosAmplEarly';
            testCase.stepOffset = +(0.5/testCase.F0);
            fprintf('\n%s\n',testCase.Name)
            testCase.fitOne  
        end        
        
        function test_FitPosAmplLate(testCase)
        % test fitting an amplitude step in the center of the window    
            testCase.setDefaults            
            testCase.Name='test_FitDefaultPosAmplEarly';
            testCase.stepOffset = -(0.5/testCase.F0);
            fprintf('\n%s\n',testCase.Name)
            testCase.fitOne  
        end        
        
        
        function test_FitDefaultNegAmpl(testCase)
        % test fitting an amplitude step in the center of the window    
            testCase.setDefaults 
            testCase.Name='test_FitDefaultNegAmpl';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:)=-0.1;
            testCase.fitOne  
        end
        
        function test_FitDefaultPosPhase(testCase)
        % test fitting an amplitude step in the center of the window    
            testCase.setDefaults
            testCase.Name='test_FitDefaultPosPhase';
            fprintf('\n%s\n',testCase.Name)
            [Xm, Fin, Ps, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = 0;
            testCase.signalParams(KaS,:) = 10;                                  
            testCase.fitOne            
        end
                
        function test_FitDefaultNegPhase(testCase)
        % test fitting an amplitude step in the center of the window    
            testCase.setDefaults
            testCase.Name='test_FitDefaultNegPhase';
            fprintf('\n%s\n',testCase.Name)
            [Xm, Fin, Ps, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = 0;
            testCase.signalParams(KaS,:) = -10;                                  
            testCase.fitOne            
        end
                
        function test_FitPosAmplSweep(testCase)
        % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
        % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_FitPosAmplSweep';
            fprintf('\n%s\n',testCase.Name)
            testCase.fitSweep            
        end  
        
        function test_FitNegAmplSweep(testCase)
        % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
        % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_FitNegAmplSweep';
            fprintf('\n%s\n',testCase.Name)
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KxS] = testCase.getParamIndex();
            testCase.signalParams(KxS,:) = -0.1;
            testCase.fitSweep            
        end           
        
       function test_FitPosPhaseSweep(testCase)
        % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
        % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_FitPosPhaseSweep';
            fprintf('\n%s\n',testCase.Name)
 
            [Xm, Fin, Ps, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KaS,:)=10;    % +10 degree step 
            testCase.signalParams(KxS,:)=0;    % +10 degree step 
            testCase.fitSweep
       end  
       
       function test_FitNegPhaseSweep(testCase)
        % loop sweeps the step location by 1/10 cycle from -1/2 cycle to +1/2 cycle from center
        % This simulates the PMU test using equivalent time sampling
            testCase.setDefaults
            testCase.Name='test_FitNegPhaseSweep';
            fprintf('\n%s\n',testCase.Name)
 
            % signal parameters to be used to calcualte expected values
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams(KaS,:)=-10;    % +10 degree step 
            testCase.signalParams(KxS,:)=0;    % +10 degree step 
            testCase.fitSweep
       end
       
       % In the NISTPluggableModules PmuAnalysisClass:Fitter.vi, a disabled
       % diagram allows for saving the complete input to the fitter in the
       % user's PMUCal output folder.  Copy that file to the active matlab
       % folter and rename it "SavedStepFit.mat"
       function test_CapturedStep(testCase)
           
           A = open('SavedStepFit.mat');
           P = A.P;
           clear A
           
           for i = 1:length(P)
               testCase.Name = sprintf('test_CapturedStep iteration %d',i);
               fprintf('\n%s\n',testCase.Name)
               
               testCase.signalParams = P(i).SignalParams;
               testCase.DelayCorr = P(i).DelayCorr;
               testCase.MagCorr = P(i).MagCorr;
               testCase.F0 = P(i).F0;
               testCase.AnalysisCycles = P(i).AnalysisCycles;
               testCase.Fs = P(i).SampleRate;               
               Y = P(i).Samples;
               
               [Synx,Freq,ROCOF] = StepFit (...
                testCase.signalParams, ...
                testCase.DelayCorr, ...
                testCase.MagCorr, ...
                testCase.F0, ...
                testCase.AnalysisCycles, ...
                testCase.Fs, ...
                Y ...
                );
            
                fprintf('Synx = %f, Freq = %f, ROCCOF = %f', Synx, Freq, ROCOF);
           end
       end
       
         
       function fitOne(testCase)
           tau = testCase.stepOffset;
           [Xm, Fin, Ps, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
           a=testCase.signalParams(Xm,:);
           w=testCase.signalParams(Fin,:)*2*pi;
           p=testCase.signalParams(Ps,:)*pi/180;
           Kx=testCase.signalParams(KxS,:);
           Ka=testCase.signalParams(KaS,:);
           
           testCase.exp = (1+(tau<0)*Kx).*a.*exp(1i.*((-tau*w)+(p+(tau<0)*Ka)));
           testCase.exp = [testCase.exp testCase.exp(1)];

           runOneFit(testCase)
       end
       
       
        function fitSweep(testCase)             
            %get signal parameters for expected values
            [Xm, Fin, Ps, ~, ~, ~, ~, ~, ~, ~, ~, KaS, KxS] = testCase.getParamIndex();
            a=testCase.signalParams(Xm,:);
            w=testCase.signalParams(Fin,:)*2*pi;
            p=testCase.signalParams(Ps,:)*pi/180;
                        
            testCase.stepOffset = -(0.5/testCase.F0);
            for i = 1:10
                tau = testCase.stepOffset;
                disp(sprintf('\nTau=%f',tau))
                Kx=testCase.signalParams(KxS,:);
                Ka=testCase.signalParams(KaS,:);
                
                % calculate expected values
                testCase.exp = (1+(tau<0)*Kx).*a.*exp(1i.*((-tau*w)+(p+(tau<0)*Ka)));
                testCase.exp = [testCase.exp testCase.exp(1)];
                
                runOneFit(testCase)
                testCase.stepOffset = testCase.stepOffset + 0.1/testCase.F0;
            end
           
       end
        
        
    end
    
%% Private methods
    methods (Access = private)
         
        function setDefaults(testCase)
            
            [Xm, Fin, Ps, Fh, Ph, Kh, Fa, Ka, Fx, Kx, Rf, KaS, KxS] = testCase.getParamIndex();
            
            testCase.AnalysisCycles = 6;
            testCase.stepOffset = 0;
            testCase.Ignore = 5;
            NPhases = 3; % Number of phases to analyse
            
            testCase.Name = 'Default Amplitude Step';
            testCase.t0 = -1; % beginning of the time series
            testCase.Fs = 48000;
            testCase.F0 = 50;
            testCase.sizeMax = testCase.Fs*2; % size of the time series 
            testCase.MagCorr = ones(1,NPhases);
            testCase.DelayCorr = zeros(1,NPhases);
            
            % signal parameters
            testCase.signalParams = zeros (13,NPhases);
            testCase.signalParams(Xm,:) = 1;
            testCase.signalParams(Fin,:) = 50;
            testCase.signalParams(Ps,:) = [0,-120,120];
            testCase.signalParams(KxS,:) = 0.1;
            
            testCase.SettlingTime = 7/testCase.signalParams(Fin,1);
            testCase.MagCorr = ones(1,NPhases);
            testCase.DelayCorr = zeros(1,NPhases);
           
        end


%       Run one iteration of stepLocate 
        function runOneLocate(testCase)
        % Analyses the results after the test returns the values
           [~,Y] = testCase.getWaveform(testCase);
            
            [tau] = StepLocate (...
                testCase.Fs, ...
                Y, ...
                testCase.Ignore ...
                );
            fprintf('tau1=%e, tau2=%e, tau3=%e\n',tau(1),tau(2),tau(3));
            % verify the result, allowed to be up to 2 samples off
            testCase.verifyEqual(tau,testCase.exp,'AbsTol',2/testCase.Fs);
           
            
        end

%       Run one iteration of stepFit       
        function runOneFit(testCase)
           [~,Y] = testCase.getWaveform(testCase);
 
            [Synx,Freq,ROCOF] = StepFit (...
                testCase.signalParams, ...
                testCase.DelayCorr, ...
                testCase.MagCorr, ...
                testCase.F0, ...
                testCase.AnalysisCycles, ...
                testCase.Fs, ...
                Y ...
                );
            
            testCase.verifyEqual(Synx,testCase.exp,'RelTol',1e-5)
            %testCase.verifyEqual(Freq,testCase.signalParams(2,:),'RelTol',1e-5)
 
           
        end
        
        
    end
    
  methods(static)
      
  end
    
end
        
