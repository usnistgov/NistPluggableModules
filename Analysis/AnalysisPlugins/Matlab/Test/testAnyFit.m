classdef testAnyFit < matlab.unittest.TestCase
    % Class-based unit testing for all of the PMU fitters
    %
    %   run these tests with two command-line commands:
    %   >> testCase = testAnyFit();
    %   >> res = run(testCase);
    %
    
    properties
        Name    % Test name
        SignalParams    % Parameters input to PmuTestSignals
        TS      % Time series structure to be analysed
        AnalysisCycles  % number of fundamental cycles to be analysed
        Fs      % sample rate
        Window  % window of AnalysisCycles to be analysed by the fitter
        DlyCorr % Delay correction factors
        MagCorr % Magnitude correction factors
        expect     %expected values
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
        
        function self = testAnyFit(varargin)
        % Class Constructor
        % obj = TestSSFit (['Fs', (Samplerate)],['AnalysisCycles'],(n))
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
        
        %===================================
        function self=setTsDefaults(self)
            % Clear the SignalParams and set default values
            self.Name = 'Default';
            self.SignalParams = zeros(15,6);
            self.SignalParams(1,:) = 1;
            self.SignalParams(2,:) = 50;
            self.SignalParams(3,:) = [0,-120,120,0,-120,120];
        end
        
    end
    
   %----------------------------------------------------------------------
    %% Test Methods
    % These functions will be called on   >> "res = run(testCase);"
    methods (Test)
        function regressionTests (self)
            %test50f0(self)      % test the nominal 50 Hz steady state fit
            test50f0_100h0(self)
            %testCapture (self)
        end
    end

    %----------------------------------------------------------------------
    %% Public methods
    methods (Access = public)
        
 
        %======================================
        function oneSSFit(self)
        % Run one Steady State Fit          
            [Synx,Freq,ROCOF] = SteadyStateFit (...
                self.SignalParams,...
                self.DlyCorr, ...
                self.MagCorr, ...
                self.TS.f0, ...
                self.AnalysisCycles, ...
                self.Fs, ...
                self.Window);

            

            act = [Synx,Freq,ROCOF];
            
            disp(self.TS.Name)            
            fprintf('Magnitudes: %f %f %f %f %f %f %f %f \n',abs(Synx(1:8)));
            fprintf('Phases: %f %f %f %f %f %f %f %f \n', angle(Synx(1:8))*180/pi);
            fprintf('Freq %f, ROCOF %f\n', Freq, ROCOF)
            if numel(Synx) > 8
                fprintf('Harmonic Magnitudes: %f %f %f %f %f %f\n', abs(Synx(9:14)));
                fprintf('Harmonic Phases: %f %f %f %f %f %f\n', angle(Synx(9:14))*180/pi)
            end
            self.verifyEqual(act,self.expect,'AbsTol',0.001)
            %pause;
        end  
        
        %=======================================
        function test50f0(self)
        % Steady State 50 Hz fitter test
            self.setTsDefaults;
            self.getTimeSeries;
            self.getWindow(0);
            plot(self.Window');
            self.expect = [1-i*0, exp(-i*2*pi/3), exp(i*2*pi/3), 1-i*0,...
                        1-i*0, exp(-i*2*pi/3), exp(i*2*pi/3), 1-i*0,...
                        50, 0];
            self.oneSSFit;            
        end      
        
        %==========================================
        function test50f0_100h0(self)
        % Steady State 50 Hz with 100 Hz harmonic fitter test
            self.setTsDefaults;
            Ah = 0.1;    % harmonic index
            [~,~,~,Fh,Ph,Kh] = self.getParamIndex;  
            self.SignalParams(Fh,:)=100;
            self.SignalParams(Ph,:) = [0, -120, 120, 0, -120, 120];
            self.SignalParams(Kh,:) = Ah;
            % expected values
            AhRt2 = Ah*sqrt(2);                    
            self.expect = [1-1i*0, exp(-1i*2*pi/3), exp(1i*2*pi/3), 1-1i*0,...
                        1-1i*0, exp(-1i*2*pi/3), exp(1i*2*pi/3), 1-1i*0,...
                        AhRt2-1*0, AhRt2*exp(-1i*2*pi/3), AhRt2*exp(1i*2*pi/3),...
                        AhRt2-1*0, AhRt2*exp(-1i*2*pi/3), AhRt2*exp(1i*2*pi/3),...
                        50, 0];            
            self.getTimeSeries;
            self.getWindow(0);
            self.oneSSFit;            
        end            
        
        %==========================================
        function testCapture (self)
        % Uses the windowed data captured to the user's output folder
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
        
       function self = getTimeSeries(self)
        % Returns the signal and the size from PmuWaveforms (found in
        % ../FGen/MemberClasses/Matlab)
            [self.TS.Y, self.TS.N] = PmuWaveforms(...
                self.TS.t0, ...
                self.TS.SettlingTime, ...
                self.TS.N, ...
                self.Fs, ...
                self.SignalParams);
            self.TS.X = self.TS.t0-self.TS.SettlingTime:1/self.Fs:((self.TS.N-1)/self.Fs)+self.TS.t0+self.TS.SettlingTime;            
        end
                
        %=======================================
        function self = getWindow(self,offset)
        % get a window of analysisCycles for analysis
            
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
        