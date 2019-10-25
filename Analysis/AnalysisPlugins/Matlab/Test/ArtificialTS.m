classdef ArtificialTS
    % Class for synthesizing a time series
    properties (Access = public)
        Name            % string name of the time series
        Description     % string describing the TS
        
        % time vector parameters
        N               % size of the time series
        t0              % start time of the time series 
        dt              % 1/sampleRate
        
        % time series (signal) parameters
        A               % Amplitude
        phi0            % initial starting phase (radians)
        f0              % initial starting frequency
        df              % rate of change of frequency
        TS              % time series
        
        % noise
        NoiseUniformLow % double Uniform distribution noise lowest value
        NoiseUniformHi  % double Uniform distribution noise highest value
        NoiseGaussMean  % double noise mean value
        NoiseGaussSD    % double noise standard deviation

        Valid           % are the input parameters valid?
        t               % time vector
    end
    
    methods
        %Constructor
        function ArtTS = ArtificialTS(...
                    Name, ...
                    Description, ...
                    N, ...
                    t0, ...
                    A, ...
                    phi0, ...
                    f0, ...
                    df, ...
                    NoiseUniformLow, ...
                    NoiseUniformHi, ...
                    NoiseGaussMean, ...
                    NoiseGaussSD ...                     
                    )
                if nargin > 0
                    ArtTS.Name = Name;
                    ArtTS.Description = Description;
                    ArtTS.N = N;
                    ArtTS.t0 = t0;
                    ArtTS.A = A;
                    ArtTS.phi0 = phi0;
                    ArtTS.f0 = f0;
                    ArtTS.df = df;
                    ArtTS.NoiseUniformLow = NoiseUniformLow;
                    ArtTS.NoiseUniformHi = NoiseUniformHi;
                    ArtTS.NoiseGaussMean = NoiseGaussMean;
                    ArtTS.NoiseGaussSD = NoiseGaussSD;
                    
                    ArtTS.Valid = ArtTS.checkValid;
                    ArtTS.TS = ArtTS.makeTS.Ts;
                end
        end
        
        % check if the input parameters are valid
        function ArtTS = checkValid(ArtTS)
            ArtTs.Valid = false;
            if ArtTS.N < 1 
                error ('ArtTS.N must be greater than one sample')
            end
            if ArtTS.f0 < 0
                error ('ArtTS.f0 must have a starting frequency equal or greater than 0')
            end
            ArtTS.Valid = true;
        end
        
        % makeTime
        function ArtTS = makeTime(ArtTS)
            %ArtTS.t = ((0:1:ArtTS.N)*ArtTS.dt)+ArtTS.t0;
            ArtTS.t = linspace(-ArtTS.N/2*ArtTS.dt,ArtTS.N/2*ArtTS.dt,ArtTS.N);
        end
        
        % makeTS
        function [ArtTS] = makeTS(ArtTS)
            ArtTS = ArtTS.checkValid;
            
            % if no time series yet exists, make one

            ArtTS.t = linspace(-ArtTS.N/2*ArtTS.dt,ArtTS.N/2*ArtTS.dt,ArtTS.N)+ArtTS.t0;
            
            theta = ((pi*((2*ArtTS.f0*ArtTS.t)+(ArtTS.df*ArtTS.t.^2)))+ArtTS.phi0);
            ArtTS.TS = ArtTS.A*exp(1i*theta);
                                         
        end
    end
end
            
                    
