classdef AnalyticTS_class
    %ANALYTICTS_CLASS creates a time series object containing one or more
    %channels of analytic (complex) signals.
    
    %The parameters of these signals match the PMU perfoemance standard.
    % This is different from the ArtificialTS class.  That class creates
    % real waveforms which are fourier combinations of pre sinusoidal
    % components. This class can create dynamic waveforms cush as AM or FM
    % modulated signals, frequency ramps, steps in amplitude or phase or
    % combinations of only two sinusoidal components one harmonic or one
    % interharmonic
    
% % signalparams  (Note that the labeling convention comes mostly from the standard)
%     Xm = signalparams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS)
%     Fin = signalparams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
%     Ps = signalparams(3,:);     % phase 
%     Fh = signalparams(4,:);     % Frequency of the interfering signal
%     Ph = signalparams(5,:);     % Phase of the interfering signal
%     Kh = signalparams(6,:);     % index of the interfering signal    
%     Fa = signalparams(7,:);     % phase (angle) moduation frequency
%     Ka = signalparams(8,:);     % phase (angle) moduation index
%     Fx = signalparams(9,:);     % amplitude moduation frequency
%     Kx = signalparams(10,:);     % amplitude moduation index
%     Rf = signalparams(11,:);     % ROCOF
%     KaS = signalparams(12,:);   % phase (angle) step index
%     KxS = signalparams(13,:);   % magnitude step index
%     KfS = signalparams(14,:);   % frequency step index
%     KrS = signalparams(15,:);   % ROCOF step index (another way to create a frequency ramp)
%        
    
    properties
        Ts = timeseries()   % a single timeseries instance (see MATLAB timeseries object)
        SignalParams        % double array, rows of parameters and collumns of channels
        SampleRate
        T0
        F0
        Duration
        SettlingTime        
    end
    
    %% =========================================================================
    %constructor
    methods
        function obj = AnalyticTS_class(varargin)
            %ANALYTICTS_CLASS Construct an instance of this class
            %   Useage: obj = AnalyticTS_class(<name,value>,<name,value>,...)
            % all arguments are optional
            
            defaultName = 'Time series';
            defaultT0 = 0;             % start time in seconds
            defaultF0 = 50;
            defaultSampleRate = 4800;  % samples per second
            defaultDuration = 1;       % duration of the data (in Ts.TimeInfo.Units)
            defaultUnits = 'seconds';
            defaultSettlingTime = 0;   % time of static sinusoid before any dynamics begin, also added to the end of the dynamics.
            defaultSignalParams = [1,50,0,0,0,0,0,0,0,0,0,0,0,0,0]';
            
            p = inputParser;
            
            % validation
            validScalar = @(x) isnumeric(x) && isscalar(x);
            validScalarPosNum = @(x) isnumeric(x) && isscalar(x) && (x > 0);
            validScalarPosInt = @(x) isnumeric(x) && isscalar(x) && isinteger(x) && (x > 0);
            %validateSignalParams = @(x) validateattributes(x,{'double'},('nRows',15));
            validateSignalParams = @(x) isnumeric(x);
            
            addParameter(p,'Name',defaultName,@ischar);
            addParameter(p,'T0',defaultT0,validScalar);
            addParameter(p,'F0',defaultF0,validScalar);
            addParameter(p,'SampleRate',defaultSampleRate,validScalarPosNum);
            addParameter(p,'Duration',defaultDuration,validScalarPosNum);
            addParameter(p,'Units',defaultUnits,@ischar);
            addParameter(p,'SettlingTime',defaultSettlingTime,validScalar);
            addParameter(p,'SignalParams',defaultSignalParams,validateSignalParams);
            
            parse(p,varargin{:})
            obj.Ts.Name = p.Results.Name;
            obj.T0 = p.Results.T0;
            obj.F0 = p.Results.F0;
            obj.SampleRate = p.Results.SampleRate;
            obj.Duration = p.Results.Duration;
            obj.Ts.TimeInfo.Units = p.Results.Units;
            obj.SettlingTime = p.Results.SettlingTime;
            obj.SignalParams = p.Results.SignalParams;
            
            %obj = obj.makeUniformTime();
            obj = obj.AnalyticWaveforms();
            
        end
    end
    
    %% =========================================================================
    % public methods found in a class method file
    methods (Access = public)
        obj = AnalyticWaveforms(obj)
        window = getWindow(obj,offset,analysisCycles,varargin)
        [Synx,Freq,ROCOF] = getWindowCenterParams(obj,offset,analysisCycles)
    end
    %% =========================================================================
    % static methods found in a class method file
    methods (Static)
        Size = SizeLcmPeriods(Freqs, Fs)
    end    
    
    %% =========================================================================
    % public methods
    methods (Access = public)
        
        function obj = makeUniformTime(obj)
            % Created the Ts.Time vector.
            totalTime = obj.Duration + 2*obj.SettlingTime;
            obj.Ts.Time = (0:(totalTime*obj.SampleRate)-1)/obj.SampleRate;
            obj.Ts = setuniformtime(obj.Ts,'StartTime',obj.T0,'Interval',1/obj.SampleRate);
        end
        
    end
    
    %% =========================================================================
    % static methods
    methods(Static)
        function [varargout] = getParamVals(signalparams)
            for i = 1:nargout
                varargout{i}=signalparams(i,:);
            end
        end
            
        function [varargout] = getParamIndex()
            for i = 1:nargout
                varargout{i}=i;
            end            
        end 

    end
    %% =========================================================================
end

