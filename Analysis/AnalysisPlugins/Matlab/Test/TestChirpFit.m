% Test Class Definition
classdef TestChirpFit < matlab.unittest.TestCase
    
% Class-based unit testing for chirp parameter estimation
%
%   run these tests with two command-line commands:
%   >> testCase = TestChirpFit;
%   >> res = run(testCase);
%    
    
    properties
        TS      % time series to be analysed
        exp     % Expected Solution
    end


    % Test Methods
    methods (Test)
        function regressionTests (testCase) 
            setTsDefaults(testCase)
            %testArt (testCase)
            testLab (testCase)
        end
    end
    
    %----------------------------------------------------------------------
    methods (Access = private)
        function testConstructor (testCase)
            chirpEst = ChirpEst();
        end
        
        function setTsDefaults(testCase)
            testCase.TS = ArtificialTS;
            testCase.TS.Name = 'Test #';
            testCase.TS.N = 10; % size of the time series
            testCase.TS.t0 = 0; % beginning of the time series
            testCase.TS.dt = 1;  % 1/SampleRate
            testCase.TS.A = 1;
            testCase.TS.df = 0; % rate of change of frequency
            testCase.TS.f0 = 1; % frequency
            testCase.TS.phi0 = 0;
            testCase.TS.NoiseUniformLow = 0;
            testCase.TS.NoiseUniformHi = 0;
            testCase.TS.NoiseGaussMean = 0;
            testCase.TS.NoiseGaussSD = 0;
        end
        %-------------------------------
        % One of the series of tests
        function testOnce(testCase)
            disp(testCase.TS.Name)
            testCase.TS = testCase.TS.makeTS;
            chirpEst = ChirpEst();          % object constructor
            figure(1)
            plot(testCase.TS.t,real(testCase.TS.TS))
            [Ain, f, df, phi] = chirpEst.ChirpFit(...
                real(testCase.TS.TS),...
                testCase.TS.dt,...
                testCase.TS.f0,...
                testCase.TS.df);
            act = [Ain f df phi];
            
             
            msg = sprintf('actual: %f %f %f %f',act);
            disp(msg);
            msg = sprintf('expected: %f %f %f %f',testCase.exp);
            disp(msg);
            
            %fftOfTs (testCase);
            
            %testCase.verifyEqual(act,testCase.exp,'AbsTol',0.001)
            %pause;
            
        end
        
        %-------------------------------
        function testLab (testCase)
%             testCase.TS.N = 21;
%             testCase.TS.dt = 1;
%             testCase.TS.A = 2;
%             testCase.TS.f0 = 0.1;
%             testCase.TS.df = 0;
%             testCase.TS.phi0 = 0;
%             testOnce (testCase);

%             testCase.TS.Name = 'Test 50Hz, 0 Hz/sec t0=0';
%             testCase.TS.N = 96*3;
%             testCase.TS.t0 = 0;
%             testCase.TS.dt = 1/4800;
%             testCase.TS.f0 = 50;
%             testCase.TS.df = 0;
%             testCase.TS.phi0 = 0;
%             testCase.exp = [1, 50, 0, 0];
%             testOnce (testCase);


            testCase.TS.Name = 'Test 50Hz, 1 Hz/sec t0=0';
            testCase.TS.N = 96*3000;
            testCase.TS.t0 = 0;
            testCase.TS.dt = 1/4800;
            testCase.TS.f0 = 50;
            testCase.TS.df = .1;
            testCase.TS.phi0 = 0;
            testCase.exp = [testCase.TS.A, testCase.TS.f0, testCase.TS.df, testCase.TS.phi0];
            testOnce (testCase);
            
%             testCase.TS.Name = 'Test 55 Hz, 1Hz/sec t0 = 5';
%             %testCase.TS.phi0 = .25*pi;
%             testCase.TS.t0 = 5;
%             testCase.exp = [1, 55, 1, 3.1410];
%             testOnce (testCase);
%             
%             testCase.TS.Name = 'Test 45 Hz, 1Hz/sec t0 = -5';
%             testCase.TS.phi0 = -.25*pi;
%             testCase.TS.t0 = -5;
%             testCase.exp = [1, 45, 1, 0];
%             testOnce (testCase);  
        end
        %-------------------------------
        function fftOfTs (testCase)
            % perform an fft of the time series
            X = testCase.TS.TS;
            Y = fft(X);
            N = length(X);
            P2 = abs(Y/N);
            P1 = P2(1:N/2+1);
            P1(2:end-1) = 2*P1(2:end-1);
            Fs = 1/testCase.TS.dt;
            f = Fs*(0:(N/2))/N;
            figure(2)
            stem(f,P1)
            title ('Single-Sided Amplitude Spectrum of X(t)')
            xlabel('f (Hz)')
            ylabel('Magnitude')
            
        end
            
            
            
            
    end
end
            