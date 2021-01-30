classdef testAnyFit < matlab.unittest.TestCase
    % Class-based unit testing for all of the PMU fitters
    %
    %   run these tests with two command-line commands:
    %   >> testCase = testAnyFit();
    %   >> res = run(testCase);    
    %
    %   List of optional Name. Value Parameters showing default parameters
    %       'F0', 50            default nominal frequency
    %       'Fs', 4800          default waveform sample rate
    %       'AnalysisCycles', 6 default Number of nominal cycles in the analysis wondow
    %
    % List of fitters tested by this unittest class
    %   
    %   SteadyStateFit.m : Fits Frequency Range, Maginitude Range, Harmonic and Interharmic tests
    %
    
    properties
        Name    % Test name
        F0 = 50       % nominal frequency
        Fs = 4800     % sample rate
        AnalysisCycles = 6 % number of fundamental cycles to be analysed
        SignalParams    % Parameters input to PmuTestSignals
        TS      % Time series structure to be analysed
        Window  % window of AnalysisCycles to be analysed by the fitter
        DlyCorr % Delay correction factors
        MagCorr % Magnitude correction factors
        expect     %expected values
        fig = 1 % figure numbers
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
            if nargin > 0
                for i = 1 : 2 : numel(varargin)
                    switch varargin{i}
                        case 'F0'
                            self.F0 = varargin{i+1};
                        case 'Fs'
                            self.Fs = varargin{i+1};
                        case 'AnalysisCycles'
                            self.AnalysisCycles = varargin{i+1};
                        otherwise
                            warning ('TestSSFit constructor: unrecognised input argument %s, using default value',varargin{i})
                    end
                end
            end
            self.TS = struct('Name','default','N',self.Fs,'t0',0,'SettlingTime',0,'f0',self.F0,'X',[],'Y',[]);
            self.DlyCorr = zeros(6,1);  % used by actual hardware to compensate for absolute phase
            self.MagCorr = ones(6,1);   % used by actual hardware to compensate for input gain
        end
        
    end
   %----------------------------------------------------------------------
    %% Test Methods
    % These functions will be called on   >> "res = run(testCase);"
    methods (Test)
        function regressionTests (self)
            %test50f0(self); self.fig=self.fig+1;      % test the nominal 50 Hz steady state fit
            %test50f0_100h0(self; self.fig=self.fig+1; 
            %testSSCapture (self); self.fig=self.fig+1; 
            %test50f0_5m0_0x1(self); self.fig=self.fig+1; 
            test50f0_0m9_0x1(self); self.fig=self.fig+1; 
           %AMcFitExperiment(self); self.fig=self.fig+1;
        end
    end

    %----------------------------------------------------------------------
    %% Public methods for Steady State fitter testing
    methods (Access = public)       
      
        %=======================================
        function test50f0(self)
        % Steady State 50 Hz fitter test
            self.setTsDefaults;
            self.getTimeSeries;
            self.getWindow(0);
            plot((real(self.Window))');
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
                real(self.Window));

            

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
          
        %==========================================
        function testSSCapture (self)
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
                   self.DelayCorr, ...
                   self.MagCorr, ...
                   self.F0, ...
                   self.AnalysisCycles, ...
                   SampleRate, ...
                   Samples ...
                   );
            end
        end        

    end
    
    %----------------------------------------------------------------------
    %% Methods for the Modulation Fitter
    methods (Access = private)
        function test50f0_5m0_0x1(self)
            self.setTsDefaults()
            self.AnalysisCycles = 3;
            [ ~, ~, ~, ~, ~, ~, ~, ~, Fx, Kx] = self.getParamIndex();
            self.SignalParams(Fx,:) = 5;
            self.SignalParams(Kx,:) = 0.1;
            self.getTimeSeries();            
            self.runMod1Second(true);           
        end
        
        function test50f0_0m9_0x1(self)
            self.setTsDefaults()
            self.AnalysisCycles = 3;
            self.TS.N = self.Fs*2;  % need more than 1 second of data
            [ ~, ~, ~, ~, ~, ~, ~, ~, Fx, Kx] = self.getParamIndex();
            self.SignalParams(Fx,:) = 0.9;
            self.SignalParams(Kx,:) = 0.1;
            self.getTimeSeries();            
            self.runMod1Second(true);           
        end        
        
        function AMcFitExperiment(self)
            self.setTsDefaults();
            self.AnalysisCycles = 50;
            [ ~, ~, ~, ~, ~, ~, ~, ~, Fx, Kx] = self.getParamIndex();
            self.SignalParams(Fx,:) = 5;
            self.SignalParams(Kx,:) = 0.1;
            self.getTimeSeries(); 
            self.getWindow(0);
            [x,y] = prepareCurveData(0:1/self.Fs:1,real(self.Window(1,:)));
            plot(x,y)
                       
        end
        
        function runMod1Second(self,bDisplay)
            % run the modularon fitter for 1 second and verify the TVE, 
            % FE, and RFE with the expected result.  Optionally display the 
            % results and pause
            
            % pre allocate actual (returned fitter) data arrays and expected value arrays
            actSynx = zeros(length(self.SignalParams(1,:))+2,self.F0);
            expSynx = actSynx;            
            actFreq = zeros(self.F0);
            expFreq = actFreq;
            actROCOF = actFreq;
            expROCOF = actROCOF;
            
            % run a loop for 1 second of simulated data, comparing the fitted SynX against the center values of the window
            for i = 1:self.F0
                self.getWindow(i*(self.Fs/self.F0));
                [actSynx(:,i), actFreq(i), actROCOF(i), iter] = ModulationFit(...
                    self.SignalParams,...
                    self.DlyCorr,...
                    self.MagCorr,...
                    self.F0,...
                    self.AnalysisCycles,...
                    self.Fs,...
                    real(self.Window));
                tap = ceil(length(self.Window)/2);
                expSynx(1:3,i) = self.Window(1:3,tap)./sqrt(2); expSynx(4,i) = self.Window(1,tap)./sqrt(2);
                expSynx(5:7,i) = self.Window(4:6,tap)./sqrt(2); expSynx(8,i) = self.Window(4,tap)./sqrt(2);
                expFreq = mean(mod(diff(angle(self.Window(4,tap-5:tap+5))'),pi)-pi)*(self.Fs/(2*pi));
                expROCOF = mean(mod(diff(angle(self.Window(4,tap-6:tap+6))',2),pi)-pi)*(self.Fs/(2*pi));
            end
            
            
            TVE = sqrt(((real(actSynx)-real(expSynx)).^2+(imag(actSynx)-imag(expSynx)).^2)./(real(expSynx).^2+imag(expSynx).^2))*100;
            ME =  (abs(actSynx)-abs(expSynx))./ abs(expSynx)*100;
            PE = wrapToPi(angle(actSynx)-angle(expSynx)).*(180/pi); 
            
            if bDisplay == true
                subplot(3,1,1)
                plot(TVE'); 
                title('TVE (%)')
                subplot(3,1,2)
                plot(ME');
                title('ME (%)')
                subplot(3,1,3)
                plot(PE');
                title('PE (deg)')
                
            end
            
        end

            
            
        
    end
    %----------------------------------------------------------------------
    %% private methods
    methods (Access = private)
        
        %===================================
        function self=setTsDefaults(self)
            % Clear the SignalParams and set default values
            self.Name = 'Default';
            self.SignalParams = zeros(15,6);
            [Xm, Fin, Ps] = self.getParamIndex();
            self.SignalParams(Xm,:) = 1;
            self.SignalParams(Fin,:) = 50;
            self.SignalParams(Ps,:) = [0,-120,120,0,-120,120];
        end
        
        
        %======================================
        function self = getTimeSeries(self)
            % Returns the signal and the size from PmuWaveforms (found in
            % ../FGen/MemberClasses/Matlab)
            [self.TS.Y, self.TS.N] = AnalyticWaveforms(...
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
            %    ofset is the number of samples into the TS to begin
            
            % number of samples needed we need to use odd size windows to get a good expected value
            offset = mod(offset,(length(self.TS.Y)));    %Wrap
            nSamples = (self.AnalysisCycles*self.Fs/self.TS.f0)+1;
            
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
            plot(real(self.Window'));
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
        