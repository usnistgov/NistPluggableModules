classdef TestSSFit < matlab.unittest.TestCase
    % Class-based unit testing for ramp fitter
    %
    %   run these tests with two command-line commands:
    %   >> testCase = TestSSFit();
    %   >> res = run(testCase);
    %
    
    properties
        Name    % Test name
        TS      % Time series structure to be analysed
        exp     %expected values
        SignalParams    % Parameters input to PmuTestSignals
        AnalysisCycles  % number of fundamental cycles to be analysed
        N       % signal size
        Fs      % sample rate
        Window  % window of AnalysisCycles to be analysed by the fitter
        DlyCorr
        MagCorr
    end
    
    % % Signal params.  Note that the labeling convention comes mostly from the
    % % standard
    % At the bottom of this class is a static methods to retrieve the
    % indexes to the parameters.
    %     Xm = signalparams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
    %     Fin = signalparams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
    %     Ps = signalparams(3,:);     % phase
    %     Fh = signalparams(4,:);     % Frequency of the interfering signal
    %     Ph = signalparams(5,:);     % Phase of the interfering signal
    %     Kh = signalparams(6,:);     % index of the interfering signal
    %     Fa = signalparams(7,:);     % phase (angle) moduation frequency
    %     Ka = signalparams(8,:);     % phase (angle) moduation index
    %     Fx = signalparams(9,:);     % amplitude moduation frequency
    %     Kx = signalparams(10,:);    % amplitude moduation index
    %     Rf = signalparams(11,:);    % ROCOF
    %     KaS = signalparams(12,:);   % phase (angle) step index
    %     KxS = signalparams(13,:);   % magnitude step index
    %     KfS = signalparams(14,:);   % frequency step index
    %     KrS = signalparams(15,:);   % ROCOF step index (redundant with Rf)
    
    %%Constructor Methods
    methods (Access = public)
        % Class Constructor
        % obj = TestSSFit (['Fs', (Samplerate)],['AnalysisCycles'],(n))
        function self = TestSSFit(varargin)
           self.SignalParams = zeros(15,6);
           self.Fs = 4800; % default samplerate
           self.AnalysisCycles = 6;
            if nargin > 0
                for i = 1 : 2 : numel(varargin)
                    switch varargin{i}
                        case 'Fs'
                            self.Fs = varargin{i+1};
                        case 'AnalysisCycles'
                            self.AnalysisCycles = varargin{i+1};
                        otherwise
                            warning ('TestSSFit constructor: unrecognised input argument %s, using default value',varargin{i})
                    end
                end
            end
            self.TS = struct('Name','default','N',(self.Fs/50)*self.AnalysisCycles,'t0',0,'SettlingTime',0,'f0',50,'X',[],'Y',[]);   
            self.DlyCorr = zeros(6,1);
            self.MagCorr = ones(6,1);
        end
        
        % Clear the SignalParams and set default values 
        function self=setTsDefaults(self)
            self.Name = 'Default';
            self.SignalParams = zeros(15,6);
            self.SignalParams(1,:) = 1;
            self.SignalParams(2,:) = 50;
            self.SignalParams(3,:) = [0,-120,120,0,-120,120];
        end   
        
    end
    
      
    %----------------------------------------------------------------------
    %% Test Methods
    methods (Test)
        function regressionTests (self)
            test50f0(self)      % test the nominal 50 Hz steady state fit
            %testArt (self)
            %testLab (self)
            %testCapture (self)
            %testSignal (self)
        end
    end
    
    
    %----------------------------------------------------------------------
    %% Public methods
    methods (Access = public)
        
        % Returns the signal and the size from PmuWaveforms (found in
        % ../FGen/MemberClasses/Matlab)
        function self = getTimeSeries(self)
            [self.TS.Y, self.TS.N] = PmuWaveforms(...
                self.TS.t0, ...
                self.TS.SettlingTime, ...
                self.TS.N, ...
                self.Fs, ...
                self.SignalParams);
            self.TS.X = self.TS.t0-self.TS.SettlingTime:1/self.Fs:((self.TS.N-1)/self.Fs)+self.TS.t0+self.TS.SettlingTime;            
        end
        
        %======================================
        % One of the series of tests
        function oneSSFit(self)
            
            [Synx,Freq,ROCOF] = SteadyStateFit (...
                self.SignalParams,...
                self.DlyCorr, ...
                self.MagCorr, ...
                self.TS.f0, ...
                self.AnalysisCycles, ...
                self.Fs, ...
                self.Window);

            

            act = [abs(Synx),Freq,ROCOF];
            
            disp(self.TS.Name)            
            fprintf('actual: %f %f %f %f %f %f %f %f %f %f',act);
%             msg = sprintf('expected: %f %f %f %f',self.exp);
%             disp(msg);
%             
            %self.verifyEqual(act,self.exp,'AbsTol',0.001)
            %pause;
        end  
        
        %------------------------------
        function test50f0(self)
            self.setTsDefaults;
            self.getTimeSeries;
            self.getWindow(0);
            plot(self.Window');
            self.oneSSFit            
        end
        
        %-------------------------------
        function testLab (self)
            self.TS.Name = 'Test 50Hz, 1 Hz/sec t0=0';
            self.TS.N = 96*3;
            self.TS.t0 = 0;
            self.TS.dt = 1/self.Fs;
            self.TS.f0 = 50;
            self.TS.df = 1;
            self.TS.phi0 = 0;
            self.exp = [1/sqrt(2), 50, 1];
            %testOne (self);
        
        end
        %--------------------------------
        % Uses the windowed data captured to the user's output folder
        function testCapture (self)
            path = 'C:\Users\PowerLabNI3\Documents\PMUCAL\Output\';
            name = 'SavedSSFit.mat';
            name = strcat(path,name);
            
            A = open(name);
            P = A.P;
            clear A;
            
            for i = 1:length(P)
               self.SignalParams = P(i).SignalParams;
               DelayCorr = P(i).DelayCorr;
               MagCorr = P(i).MagCorr;
               F0 = P(i).F0;
               self.AnalysisCycles = P(i).AnalysisCycles;
               SampleRate = P(i).SampleRate;
               Samples = P(i).Samples;
               
                   
               
               [Synx,Freq,ROCOF] = SteadyStateFit ( ...
                   self.SignalParams, ...
                   DelayCorr, ...
                   MagCorr, ...
                   F0, ...
                   self.AnalysisCycles, ...
                   SampleRate, ...
                   Samples ...
                   );
               
               
            end

        end
        
        %--------------------------------
        % test the signal generator
        function testSignal (self)
            self.N = 48000;     % 10 seconds
            self.SettlingTime = 2;
            self.SignalParams(2,:) = 1;
            %self.t0 = -1;
            testOne (self)
        end
            

    end
    
    %% private methods
    methods (Access = private)
        
        % get a window of analysisCycles for analysis
        function self = getWindow(self,offset)
            
            % number of samples needed
            nSamples = self.AnalysisCycles*self.Fs/self.TS.f0;
            
            %either the time series is long enough or not
            if (length(self.TS.Y)-offset) >= nSamples
                self.Window = self.TS.Y(:,offset+1:nSamples+offset);
            else
                % not enough samples in the TS.Y.  Start ant offset+1 then
                % wrap and concatinate
                W = self.TS.Y(:,offset+1:end);
                while length(W) < nSamples
                    nRemaining = nSamples - length(W);
                    if nRemaining >= length(self.TS.Y)
                        W = horzcat(W,self.TS.Y);
                    else
                        W = horzcat(W,self.TS.Y(:,1:nRemaining)); 
                    end
                end
                self.Window = W;
            end
        end
        
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
        
    
end


