classdef testStepLocate < matlab.unittest.TestCase
    % Class-based unit testing for step locate function
    %
    %   run these tests with two command-line commands:
    %   >> testCase = testStepLocate;
    %   >> res = run(testCase);
    %
    %%
    properties
        Name            % Test name
        exp             % expected returned values from the test run
        signalParams    % Parameters input to PmuTestSignals
        sizeMax         % signal size
        t0              % signal start time
        SettlingTime
        Fs              % sample rate
        F0              % Noinal Frequency
        AnalysisCycles  % number of nominal cycles to be analysed by the fitter
        stepOffset      % signed offset, (in seconds) from 0 where the step will occur
        Window          % Window function for Hilbert transform
        Padding         % Hilbert zero padding
        Ignore          % in percent, the amount of the beginning and end of the locate detection signal to ignore in the result
    end
    
    %% Signalparams
    % Input parameters to the PMUWaveforms generator
    % This generator is capable of generating combinations of influence quantities beyone the requirements of the standard.
    % The labeling convention comes mostly from the standard. PMU standard
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
       
    methods(Static)
        
        % get the indices into the SignalParams
        function[Xm, Fin, Ps, Fh, Ph, Kh, Fa, Ka, Fx, Kx, Rf, KaS, KxS] = getParamIndex()
            Xm=1; Fin=2; Ps=3; Fh=4; Ph=5; Kh=6; Fa=7; Ka=8; Fx=9; Kx=10; Rf=11; KaS=12; KxS=13;
        end
    end
    
    %% Constructor method (called when the testCase object is created)
    methods
        function testCase = testStepLocate()
            testCase.setDefaults;
        end
    end
    
    %% Test Methods
    %   The functions in this method list are run automatically when "res=run(testCase)" is called.
    methods (Test)       
        function regressionTests (testCase)
            %runOnce(testCase)
            %testCase.no_Ignore            
            %testCase.Hamming
            %testCase.Blackman
            %testCase.Hann
            testCase.HalfPad
            
        end
    end
    
    %% Regression Tests (public so they can be called externally)
    methods(Access = public)
        
        function no_Ignore(testCase)
            testCase.Ignore = 0;
            runOnce(testCase);
        end

        function Hamming(testCase)
            testCase.Window = "Hamming";
            runOnce(testCase)
        end
        
        function Blackman(testCase)
            testCase.Ignore = 0;
            testCase.Window = "Blackman";
            runOnce(testCase)
        end
        
        function Hann(testCase)
             testCase.Ignore = 0;
           testCase.Window = "Hann";
            runOnce(testCase)
        end
        
        function HalfPad(testCase)
            testCase.Ignore = 0;
            testCase.Window = "Rectangular";
            testCase.Padding = testCase.AnalysisCycles/testCase.F0*testCase.Fs/2;
            runOnce(testCase)
        end
        
    end
    
    
    %% test method setup (called when the functions in the Test methods are called)
    methods (TestMethodSetup)        
        function setup(testCase)
            setDefaults(testCase)
        end
    end
    %% Private methods
    methods(Access = private)
        
        
        function setDefaults(testCase)
            
            testCase.Name = 'Default Amplitude Step';
            testCase.AnalysisCycles = 6; % number of nominal cycles that will be inthe analysis window (should be integer, not sure what happens if it is not)
            testCase.stepOffset = 0;     % default step will occur at the center of the window
            NPhases = 3; % Number of phases to analyse
            
            testCase.t0 = -1; % beginning of the waveform will be at -1 second
            testCase.Fs = 48000;
            testCase.F0 = 50;
            testCase.sizeMax = testCase.Fs*2; % size of the waveform (default, 2 seconds)
            % For step, sizeMax will be the size of the waveform generated with the step occuring in the center.
            % in this case, generate 2 seconds of data and the regression tests can take analysis windows out of that for shifting the step location.
            % for other (non-step) signals, PmuWaveforms generate integer combined cycles up to the sizeMax that can be concatinuated to form continuous waveforms.
            
            testCase.Window = "Rectangular";
            testCase.Padding = 0;
            testCase.Ignore = 5;
            
            % expected values for the default test case
            testCase.exp = [0,0,0];
            
            % signal parameters
            [Xm, Fin, Ps, Fh, Ph, Kh, Fa, Ka, Fx, Kx, Rf, KaS, KxS] = testCase.getParamIndex();
            testCase.signalParams = zeros (13,NPhases);
            testCase.signalParams(Xm,:) = 1;
            testCase.signalParams(Fin,:) = 50;
            testCase.signalParams(Ps,:) = [0,-120,120];
            testCase.signalParams(KxS,:) = 0.1*testCase.signalParams(Xm,:);
            testCase.SettlingTime = 7/testCase.signalParams(Fin,1);
            
        end
        
        function runOnce(testCase)
            % runs one iteration of the test using the current properties.
            % Analyses the results after the test returns the values
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
            %             % plot the windowed signal
            %             figure(100)
            %             plot(x,Y);
            
            [tau] = StepLocate (...
                testCase.Fs, ...
                Y, ...
                testCase.Window, ...
                testCase.Padding, ...
                testCase.Ignore ...
                );
            %disp(tau);
            testCase.verifyEqual(tau,testCase.exp);
            
        end
    end
    
end

