classdef testAnyFit < matlab.unittest.TestCase
    % Class-based unit testing for all of the PMU fitters
    %
    %   run these tests with two command-line commands:
    %   >> testCase = testAnyFit();
    %   >> res = run(testCase); 
    %   >> res = testCase.run();
    %
    %   List of optional Name. Value Parameters showing default parameters
    %       'F0', 50            default nominal frequency
    %       'Fs', 4800          default waveform sample rate
    %       'AnalysisCycles', 6 default Number of nominal cycles in the analysis wondow
    %
    % List of fitters tested by this unittest class
    %   
    %   SteadyStateFit.m : Fits Frequency Range, Maginitude Range, Harmonic and Interharmic tests
    %   ModulationFit.m : Fits amplitude, phase or combined modulation
    %
    
    properties
        Name    % Test name
        T0             % start time
        F0             % nominal frequency
        Fs             % sample rate
        AnalysisCycles % number of fundamental cycles to be analysed
        SignalParams    % Parameters input to PmuTestSignals
        Duration    % maximum signal duration is seconds
        SettlingTime
        TS      % Time series structure to be analysed
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
    
    %%----------------------------------------------------------------------
    %%Constructor Methods
    methods (Access = public)
        
        function self = testAnyFit(varargin)
        % Class Constructor
        
            defaultName = 'unnamed';
            defaultT0 = 0;             % start time in seconds
            defaultF0 = 50;
            defaultFs = 4800;  % samples per second
            defaultDuration = 1;       % duration of the data (in Ts.TimeInfo.Units)
            defaultAnalysisCycles =6;
            defaultSettlingTime = 0;   % time of static sinusoid before any dynamics begin, also added to the end of the dynamics.
            
            [Xm, Fin, Ps] = self.getParamIndex();
            defaultSignalParams = zeros(15,6);
            defaultSignalParams(Xm,:) = 1;
            defaultSignalParams(Fin,:) = 50;
            
            self.SignalParams(Ps,:) = [0,-120,120,0,-120,120];            defaultDlyCorr = zeros(6,1);
            defaultMagCorr = ones(6,1);
            
            p = inputParser;
            
            % validation
            validScalar = @(x) isnumeric(x) && isscalar(x);
            validScalarPosNum = @(x) isnumeric(x) && isscalar(x) && (x > 0);
            validScalarPosInt = @(x) isnumeric(x) && isscalar(x) && isinteger(x) && (x > 0);
            validateSignalParams = @(x) validateattributes(x,{'double'},{'nrows',15});
            validateCorrVals = @(x) validateatributes(x,{'double'},{'nrows',6});
            
            addParameter(p,'Name',defaultName,@ischar);
            addParameter(p,'T0',defaultT0,validScalar);
            addParameter(p,'F0',defaultF0,validScalar);
            addParameter(p,'Fs',defaultFs,validScalarPosNum);
            addParameter(p,'AnalysisCycles',defaultAnalysisCycles,validScalarPosNum);            
            addParameter(p,'Duration',defaultDuration,validScalarPosNum);
            addParameter(p,'SettlingTime',defaultSettlingTime,validScalarPosNum);
            addParameter(p,'SignalParams',defaultSignalParams,validateSignalParams);
            addParameter(p,'DlyCorr',defaultDlyCorr,validateCorrVals);
            addParameter(p,'MagCorr',defaultMagCorr,validateCorrVals);
                        
            parse(p,varargin{:})
            
            self.Name = p.Results.Name;
            self.T0 = p.Results.T0;
            self.F0 = p.Results.F0;
            self.Fs = p.Results.Fs;
            self.Duration = p.Results.Duration;
            self.SettlingTime = p.Results.SettlingTime;
            self.SignalParams = p.Results.SignalParams;
            self.AnalysisCycles = p.Results.AnalysisCycles;
            self.DlyCorr = p.Results.DlyCorr;
            self.MagCorr = p.Results.MagCorr;
           
        % obj = TestSSFit (['Fs', (Samplerate)],['AnalysisCycles'],(n))
%             self.SignalParams = zeros(15,6);
%             if nargin > 0
%                 for i = 1 : 2 : numel(varargin)
%                     switch varargin{i}
%                         case 'F0'
%                             self.F0 = varargin{i+1};
%                         case 'Fs'
%                             self.Fs = varargin{i+1};
%                         case 'AnalysisCycles'
%                             self.AnalysisCycles = varargin{i+1};
%                         otherwise
%                             warning ('TestSSFit constructor: unrecognised input argument %s, using default value',varargin{i})
%                     end
%                 end
%             end
%             % self.TS = struct('Name','default','N',self.Fs,'t0',0,'SettlingTime',0,'f0',self.F0,'X',[],'Y',[]);
        end
        
    end
   %----------------------------------------------------------------------
    %% Test Methods
    % These functions will be called on   >> "res = run(testCase);"
    methods (Test)
        function regressionTests (self)
            %test50f0(self); self.fig=self.fig+1;      % test the nominal 50 Hz steady state fit
            %test50f0_100h0(self); self.fig=self.fig+1; 
            %testSSCapture (self); self.fig=self.fig+1; 
            %test50f0_5m0_0x1(self); self.fig=self.fig+1;
            %test50f0_0m9_0x1(self); self.fig=self.fig+1;
            %test50f0_5m0_0a1(self); self.fig=self.fig+1;
            %test50f0_0m9_0a1(self); self.fig=self.fig+1;
            %test50f0_2m0_2k5(self); self.fig=self.fig+1;
            testModFitActualData(self);self.fig=self.fig+1;
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
%             self.expect = [1-1i*0, exp(-1i*2*pi/3), exp(1i*2*pi/3), 1-1i*0,...
%                         1-1i*0, exp(-1i*2*pi/3), exp(1i*2*pi/3), 1-1i*0,...
%                         50, 0];
            self.TS.Ts.Name = 'test50f0';
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
%             AhRt2 = Ah*sqrt(2);                    
%             self.expect = [1-1i*0, exp(-1i*2*pi/3), exp(1i*2*pi/3), 1-1i*0,...
%                         1-1i*0, exp(-1i*2*pi/3), exp(1i*2*pi/3), 1-1i*0,...
%                         AhRt2-1*0, AhRt2*exp(-1i*2*pi/3), AhRt2*exp(1i*2*pi/3),...
%                         AhRt2-1*0, AhRt2*exp(-1i*2*pi/3), AhRt2*exp(1i*2*pi/3),...
%                         50, 0];            
            self.getTimeSeries;
            self.TS.Ts.Name = 'test50f0_100h0';            
            self.oneSSFit;            
        end 
        
        %======================================
        function oneSSFit(self)
        % Run one Steady State Fit  
            Window = self.TS.getWindow(0,self.AnalysisCycles,'even');
         
            [Synx,Freq,ROCOF] = SteadyStateFit (...
                self.SignalParams,...
                self.DlyCorr, ...
                self.MagCorr, ...
                self.TS.F0, ...
                self.AnalysisCycles, ...
                self.Fs, ...
                real(Window.Data)'...
                );
            
            % retreive the expected values
            expSynx = Window.UserData.Vals/sqrt(2);
            symComp = self.calcSymComp(expSynx.');  % symmetrical components
            expFreq = Window.UserData.Freqs(1);
            expROCOF = Window.UserData.ROCOFs(1);
            %self.expect = horzcat(symComp,expFreq,expROCOF);
            
            % Intefering signals tests have additional frequencies
            [~,~,~,~,~,Kh] = self.getParamIndex; 
            if self.SignalParams(Kh,1) > 0;
               warning('intefering signals test not correctly implmented yet')
               Ah = self.SignalParams(Kh,:);
               expH = Ah.*expSynx;
               symComp = horzcat(symComp,expH);
            end
            self.expect = horzcat(symComp,expFreq,expROCOF);

            
            

            act = [Synx,Freq,ROCOF];
            
            disp(self.TS.Ts.Name)            
            fprintf('Magnitudes: %f %f %f %f %f %f %f %f \n',abs(Synx(1:8)));
            fprintf('Phases: %f %f %f %f %f %f %f %f \n', angle(Synx(1:8))*180/pi);
            fprintf('Freq %f, ROCOF %f\n', Freq, ROCOF)
            if numel(Synx) > 8
                fprintf('Harmonic Magnitudes: %f %f %f %f %f %f\n', abs(Synx(9:14)));
                fprintf('Harmonic Phases: %f %f %f %f %f %f\n', angle(Synx(9:14))*180/pi)
            end
            self.verifyEqual(act,self.expect,'AbsTol',0.001)
            pause;
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
    methods (Access = public)
        function test50f0_5m0_0x1(self)
            self.setTsDefaults()
            self.AnalysisCycles = 3;
            [ ~, ~, ~, ~, ~, ~, ~, ~, Fx, Kx] = self.getParamIndex();
            self.SignalParams(Fx,:) = 5;
            self.SignalParams(Kx,:) = 0.1;
            self.getTimeSeries();   
            self.TS.Ts.Name = 'test50f0_5m0_0x1';            
            self.runMod1Second(true);           
        end
        
        function test50f0_0m9_0x1(self)
            self.setTsDefaults()
            self.AnalysisCycles = 3;
            self.Duration = 2;  % need more than 1 second of data
            [ ~, ~, ~, ~, ~, ~, ~, ~, Fx, Kx] = self.getParamIndex();
            self.SignalParams(Fx,:) = 0.9;
            self.SignalParams(Kx,:) = 0.1;
            self.getTimeSeries();    
            self.TS.Ts.Name = 'test50f0_0m9_0x1';            
            self.runMod1Second(true);           
        end    
        
       function test50f0_5m0_0a1(self)
            self.setTsDefaults()
            self.AnalysisCycles = 3;
            [ ~, ~, ~, ~, ~, ~, Fa, Ka, ~, ~] = self.getParamIndex();
            self.SignalParams(Fa,:) = 5;
            self.SignalParams(Ka,:) = 0.1;
            self.getTimeSeries();  
            self.TS.Ts.Name = 'test50f0_5m0_0a1';
            self.runMod1Second(true);           
        end
        
        function test50f0_0m9_0a1(self)
            self.setTsDefaults()
            self.AnalysisCycles = 3;
            %self.TS.N = self.Fs*2;  % need more than 1 second of data
            self.Duration = 2;
            [ ~, ~, ~, ~, ~, ~, Fa, Ka, ~, ~] = self.getParamIndex();
            self.SignalParams(Fa,:) = 0.9;
            self.SignalParams(Ka,:) = 0.1;
            self.getTimeSeries();
            self.TS.Ts.Name = 'test50f0_0m9_0a1';
            self.runMod1Second(true);           
        end
        
        function test50f0_2m0_2k5(self)
            % this is a very high rate modulation (peak frequency 5 Hz, peak ROCOF 62 Hz)
            % the standard modulation fit cannot handle it so I am experimenting with an
            % HHT fitter
            self.setTsDefaults();
            self.Duration = 2;
            [ ~, ~, ~, ~, ~, ~, Fa, Ka, ~, ~] = self.getParamIndex();
            self.SignalParams(Fa,:) = 2.0;
            self.SignalParams(Ka,:) = 2.5;
            self.AnalysisCycles = self.F0/self.SignalParams(Fa,1);
            self.getTimeSeries();
            self.TS.Ts.Name = 'test50f0_2m0_2k5';
            self.runMod1Second(true);           
        end
            
        
        function AMcFitExperiment(self)
            self.setTsDefaults();
            self.AnalysisCycles = 50;
            [ ~, ~, ~, ~, ~, ~, Fa, Ka, Fx, Kx] = self.getParamIndex();
            self.SignalParams(Fa,:) = 5;
            self.SignalParams(Ka,:) = 0.1;
            self.TS = self.getTimeSeries(); 
            %self.getWindow(0);
            %[x,y] = prepareCurveData(0:1/self.Fs:1,real(self.Window(1,:)));
            [x,y] = prepareCurveData(self.TS.Ts.Time,self.TS.Ts.Data);
        end
        
        function testModFitActualData(self)
            % open the actual data file captured in PMUCal\output
            self.setTsDefaults();
            name = fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output','SavedModWindows.mat');
            if exist(name,'file')
                A = open(name);
                P = A.P;
                clear A;
            else
                error ('Data file %s not found.',name)
            end
            
            % pre allocate actual (returned fitter) data arrays and expected value arrays
            actSynx = zeros(8,numel(P));
            %expSynx = actSynx;            
            actFreq = zeros(1,numel(P));
            %expFreq = actFreq;
            actROCOF = actFreq;
            %expROCOF = actROCOF;
            
            
            
            for i = 1:numel(P)
                self.SignalParams = P(i).SignalParams;
                self.DlyCorr = P(i).DelayCorr;
                self.MagCorr = P(i).MagCorr;
                self.F0 = P(i).MagCorr;
                self.AnalysisCycles = P(i).AnalysisCycles;
                self.Fs = P(i).SampleRate;
                Window = timeseries(P(i).Samples);
                
                [actSynx(:,i), actFreq(i), actROCOF(i), iter] = ModulationFit(...
                    self.SignalParams,...
                    self.DlyCorr,...
                    self.MagCorr,...
                    self.F0,...
                    self.AnalysisCycles,...
                    self.Fs,...
                    Window.Data...
                    );
            end
            
            
            figure(self.fig); self.fig=self.fig+1;
            subplot(4,1,1)
            plot(abs(actSynx.'))
            title('Ampl')
            ylim([0,80])
            subplot(4,1,2)
            plot(unwrap(angle(actSynx.')))
            title('Phase')
            subplot(4,1,3)
            plot(actFreq)
            title('Freq')
            subplot(4,1,4)
            plot(actROCOF)
            title('ROCOF')                                     
        end
        
        function runMod1Second(self,bDisplay)
            % run the modularon fitter for 1 second and verify the TVE, 
            % FE, and RFE with the expected result.  Optionally display the 
            % results and pause
                                    
            % pre allocate actual (returned fitter) data arrays and expected value arrays
            actSynx = zeros(length(self.SignalParams(1,:))+2,self.F0);
            expSynx = actSynx;            
            actFreq = zeros(1,self.F0);
            expFreq = actFreq;
            actROCOF = actFreq;
            expROCOF = actROCOF;
            
            % run a loop for 1 second of simulated data, comparing the fitted SynX against the center values of the window
            for i = 1:self.F0
                %self.getWindow(i*(self.Fs/self.F0));
                
                Window = self.TS.getWindow(i,self.AnalysisCycles,'even');
                [actSynx(:,i), actFreq(i), actROCOF(i), iter] = ModulationFit(...
                    self.SignalParams,...
                    self.DlyCorr,...
                    self.MagCorr,...
                    self.F0,...
                    self.AnalysisCycles,...
                    self.Fs,...
                    real(Window.Data.')...
                    );
                
                
                
                expSynx(:,i) = self.calcSymComp(Window.UserData.Vals.')/sqrt(2);
                expFreq(i) = mean(Window.UserData.Freqs(1:3));
                expROCOF(i) = mean(Window.UserData.ROCOFs(1:3));
                %tap = ceil(length(Window.Data)/2)+1;
                %expSynx(1:3,i) = Window.Data(1:3,tap)./sqrt(2); expSynx(4,i) = Window.Data(1,tap)./sqrt(2);
                %expSynx(5:7,i) = Window.Data(4:6,tap)./sqrt(2); expSynx(8,i) = Window.Data(4,tap)./sqrt(2);
                %expFreq = mean(mod(diff(angle(Window.Data(tap-5:tap+5,4))),pi)-pi)*(self.Fs/(2*pi));
                %expROCOF = mean(mod(diff(angle(Window.Data(4,tap-6:tap+6))',2),pi)-pi)*(self.Fs/(2*pi));
                disp([i, iter]);
            end
            
            
            TVE = sqrt(((real(actSynx)-real(expSynx)).^2+(imag(actSynx)-imag(expSynx)).^2)./(real(expSynx).^2+imag(expSynx).^2))*100;
            ME =  (abs(actSynx)-abs(expSynx))./ abs(expSynx)*100;
            PE = wrapToPi(angle(actSynx)-angle(expSynx)).*(180/pi); 
            FE = actFreq-expFreq;
            RFE = actROCOF-expROCOF;
            
            if bDisplay == true
                figure(self.fig);
                subplot(5,1,1)
                plot(TVE'); 
                title('TVE (%)')
                subplot(5,1,2)
                plot(ME');
                title('ME (%)')
                subplot(5,1,3)
                plot(PE');
                title('PE (deg)')
                subplot(5,1,4)
                plot(FE');
                title('FE (Hz)')
                subplot(5,1,5)
                plot(RFE');
                title('RFE (Hz/s)')
                
                pause
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
            % TS is a timeseries that creates and contains one period of an
            % analytic arbitrary waveform. That period can be used as a
            % circular buffer.  It has a getWindow method which will return
            % AnalysisCycle nominal periods of that waveform with an offset
            % in nominal periods.
            self.TS = AnalyticTS_class(...
                                        'SignalParams',self.SignalParams,...
                                        'SampleRate',self.Fs,...
                                        'F0',self.F0,...
                                        'Duration',self.Duration,...
                                        'SettlingTime',self.SettlingTime...
                                        );
                                        
                                        
%             [self.TS.Y, self.TS.N] = AnalyticWaveforms(...
%                 self.TS.t0, ...
%                 self.TS.SettlingTime, ...
%                 self.TS.N, ...
%                 self.Fs, ...
%                 self.SignalParams);
%             self.TS.X = self.TS.t0-self.TS.SettlingTime:1/self.Fs:((self.TS.N-1)/self.Fs)+self.TS.t0+self.TS.SettlingTime;
        end
        
        %=======================================
%%REPLACED BY self.TS.getWindow
%         function self = getWindow(self,offset)
%             % get a window of analysisCycles for analysis
%             %    ofset is the number of samples into the TS to begin
%             
%             % number of samples needed we need to use odd size windows to get a good expected value
%             offset = mod(offset,(length(self.TS.Y)));    %Wrap
%             nSamples = (self.AnalysisCycles*self.Fs/self.TS.f0)+1;
%             
%             %either the time series is long enough or not
%             if (length(self.TS.Y)-offset) >= nSamples
%                 self.Window = self.TS.Y(:,offset+1:nSamples+offset);
%             else
%                 % not enough samples in the TS.Y.  Start ant offset+1 then
%                 % wrap and concatinate
%                 W = self.TS.Y(:,offset+1:end);
%                 while length(W) < nSamples
%                     nRemaining = nSamples - length(W);
%                     if nRemaining >= length(self.TS.Y)
%                         W = horzcat(W,self.TS.Y);
%                     else
%                         W = horzcat(W,self.TS.Y(:,1:nRemaining));
%                     end
%                 end
%                 self.Window = W;                
%             end
%             %plot(real(self.Window'));
%         end
%         
    end
    
    
    
%% Static method to get indexes into the signalParams matrix    
    methods(Static)
        % returns Xm=1;Fin=2;Ps=3;Fh=4;Ph=5;Kh=6;Fa=7;Ka=8;Fx=9;Kx=10;Rf=11;KaS=12;KxS=13;KfS=14;KrS=15
        % where variables after Ps are variable output arguments
%         function [Xm, Fin, Ps, varargout] = getParamIndex()
%             Xm=1;Fin=2;Ps=3;
%             for i = 1:nargout-3
%                 varargout{i}=i+3;
%             end
%         end    
        function [varargout] = getParamIndex()

            for i = 1:nargout
                varargout{i}=i;
            end
        end           
                
        function symComp = calcSymComp(x)
            %Calculating symmetrical components
            alfa = exp(2*pi*1i/3);
            Ai = (1/3)*[1 1 1; 1 alfa alfa^2; 1 alfa^2 alfa];
            
            Vabc = x(1:3,:);
            Vzpn = Ai*Vabc; %voltage: zero, positive and negative sequence
            
            Iabc = x(4:6,:);
            Izpn = Ai*Iabc; %curren: zero, positive and negative sequence
            
            symComp = horzcat(Vabc.',Vzpn(2),Iabc.',Izpn(2));
        end
        
        
        
    end
        
    
end    
        