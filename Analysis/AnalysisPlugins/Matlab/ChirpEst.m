classdef ChirpEst
    % Attempts to use the Powell Method to find the parameters of a linear
    % chirp:
    %   Assumptions:
    %       Input signal has low noise (< 0.2% THD+N)
    %       Chirp is linear (df is a constant)
    %       Guesses are resonably close (how close they need to be is TBD)
    
    properties (Access = public)
        maxIter = 1000;       % maximum number of iterations
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
            %       dt: 1/sample rate
            %
            % The chirp-like model:
            %   w = 2*pi*F, dw = pi*dF 
            % Y(t) = X(t) + A cos(w*t + dw*t^2) + B sin (w*t + dw*t^2)
            %      = X(t)+A cos(w*t)+B sin(w*t)+C cos(dw+t^2)+D sin(dw*t^2)
                                
            
            N = length(x);
            t = linspace(-N/2*dt,N/2*dt,N);
                        
            % Step 1: Elimate the sine part due to w:
            % This is just the 4-parameter sine fit
            
            w = 2*pi*fGuess;
            theta = w*t;
            H = [ones(1,N)' cos(theta)' sin(theta)'];
            
            % Traditional Least Squares Linear Fit to get initial A and B
            S = (H'*H)\(H'*x');
            A = S(2); B = S(3);
            
            % Four Parameter Cosine Fit 
            for k = 1:obj.maxIter
                theta = w*t;
                H = [ones(1,N)' cos(theta)' sin(theta)'];
                G = [H (-A*t.*sin(theta)+B*t.*cos(theta))'];
                S = (G'*G)\(G'*x');
                A=S(2); B=S(3); DC = S(1);
                dw = S(4);
                w = w + dw;
                
                % exit criterion
                if abs(dw) < obj.fitCrit
                    break
                end                
            end
            
            
            % now subtract the fitted model from the signal
            xHat =  x - (DC + A*cos(w*t) + B*sin(w*t));
            
            % DEBUG: plot the original and the remaining
            figure(1);
            subplot(3,1,1);
            plot(t,x)
            subplot(3,1,2)
            plot(t,DC + A*cos(w*t) + B*sin(w*t))          
            subplot(3,1,3)
            plot(t,xHat)
            
            %figure(2)
            %plot(t,x,'--',t,(A*cos(w*t) + B*sin(w*t)),'-' );
            
            % Step 2, now we know w, find the dw            
            % find initial C and D
            dw = pi*dfGuess;
            %if dw ~= 0
                theta = dw*t.^2;
                H = [cos(theta)' sin(theta)'];
                S = (H'*H)\(H'*xHat');
                C = S(1); D = S(2);
                
                for k = 1:obj.maxIter
                    
                    %debug ===============================================
                    
                    xGuess = C*cos(theta) + D*sin(theta);
                    figure(2)
                    subplot(2,1,1)
                    plot(t,xGuess,'--')
                    subplot(2,1,2)
                    plot(t,xHat-xGuess)                                        
                    %=====================================================
                    
                    theta = dw*(t.^2);
                    H = [cos(theta)' sin(theta)'];
                    G = [H (-C*(t.^2).*sin(theta)+D*(t.^2).*cos(theta))'];
                    S = (G'*G)\(G'*xHat');
                    C = S(1); D = S(2);
                    ddw = S(3);
                    dw = dw + ddw;
                    
                    %exit criterion
                    if abs(ddw) < obj.fitCrit
                        break
                    end
                end
                
                % step 3: We need to do one final LSE to find magnuitude
                % and phase

                %dw=pi;
                theta = w*t + dw*t.^2;
                H = [ones(1,N)' cos(theta)' sin(theta)'];
                S = (H'*H)\(H'*x');
                A = S(2); B = S(3); DC = S(1);
            %end
    xHat =  x - (DC + A*cos(w*t) + B*sin(w*t));
            
            % DEBUG: plot the original and the remaining
            figure(1);
            subplot(3,1,1);
            plot(t,x)
            subplot(3,1,2)
            plot(t,DC + A*cos(w*t) + B*sin(w*t))          
            subplot(3,1,3)
            plot(t,xHat)
            
            Ain = sqrt(A^2+B^2);
            phi = atan2(B,A);
            f = w/(2*pi);
            df = dw/pi;
            

                

                
            
            
            
            
            
%             disp(k)
%             disp(deltaF)
%             disp(obj.fitCrit)
%             f = Freq;
%             df = dfGuess;
%             Ain = sqrt(A^2 + B^2);
%             phi = atan2(B,A);
%             
            
        end
        
    end
    
    
end



