classdef ChirpEst
    % Attempts to use the Powell Method to find the parameters of a linear
    % chirp:
    %   Assumptions:
    %       Input signal has low noise (< 0.2% THD+N)
    %       Chirp is linear (df is a constant)
    %       Guesses are resonably close (how close they need to be is TBD)
    
    properties (Access = public)
        maxIter = 50;       % maximum number of iterations
        fitCrit = 1e-5;      % grdient descent stop threshold
        
    end
    
    methods (Access = public)
        % constructor
        function obj = ChirpEst(maxIter, fitCrit)
            if nargin > 0
                obj.maxIter = maxIter;
                obj.fitCrit = fitCrit;
            end
            
        end   %constructor
        
        function [Ain,f,df,phi] = ChirpFit(obj, x, dt, fGuess, dfGuess)
            % estimates the frequency(f), frequency rate (df) and phase (phi) of a
            % linear chirp.
            %   inputs:
            %       x:  input signal
            %       dt:
            
            %pre-allocate some vectors
%             A = zeros(obj.maxIter,1);
%             B = zeros(obj.maxIter,1);  
%             Freq = zeros(obj.maxIter,1);
%             deltaF = zeros(obj.maxIter,1);
            
            N = length(x);
            %t = (0:N-1)*dt;
            t = linspace(-N/2*dt,N/2*dt,N);
                        
            % Generate the initial model:
            theta = (pi*((2*fGuess)*t)+(dfGuess*t.^2));
            H = [ones(1,N)' cos(theta)' sin(theta)'];
            
            % Traditional Least Squares Linear Fit
            S = (H'*H)\(H'*x');
            A = S(2); B = S(3);
            
            % Four Parameter Cosine Fit (assumes dfGuess is exact)
            % TODO:  Later try using Powell's Method to optimize on F and
            % dF
            Freq = fGuess;
            dFreq = dfGuess;
            for k = 1:obj.maxIter
                theta = (pi*(2*Freq*t)+(dFreq*t.^2));
                H = [ones(1,N)' cos(theta)' sin(theta)'];
                G = [H (-A*t.*sin(theta)+B*t.*cos(theta))'];
                S = (G'*G)\(G'*x');
                A=S(2); B=S(3);
                deltaF = S(size(S,1))/(2*pi);
                Freq = Freq + deltaF;
                
                % exit criterion
                if abs(deltaF) < obj.fitCrit
                    break
                end                
            end
            
            disp(k)
            disp(deltaF)
            disp(obj.fitCrit)
            f = Freq;
            df = dfGuess;
            Ain = sqrt(A^2 + B^2);
            phi = atan2(B,A);
            
            
        end
        
    end
    
    
end



