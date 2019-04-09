function [Timestamp,...
          Synx,...
          Freq,...
          ROCOF] = AnnexDPmu( ...
                        Signal, ...
                        bPosSeq, ...
                        FilterParams, ...
                        WindowType, ...
                        T0, ...
                        F0, ...
                        Fs, ...
                        FSamp, ...
                        SettlingTime ...
                      )  
                     
% Overview this implements a PMU model in the style of the C37.118.1 Annex
% Signal Processing model in that it uses a quadrature demodulator to
% perform the DFT yeilding an unfiltered difference and sum signal.  It
% then filters the DFT signal using parametrizable FilterTypes.  finally it
% decimates the signal down to the PMU reporting rate.

% FilterParams
Fr = FilterParams(1);        % Filter cutoff frequency
N = FilterParams(2);         % Filter order (there will be one more sample than the order number)

% Check for some common errors
if (FSamp/Fs)-floor(FSamp/Fs) ~= 0
    errMsg = sprintf('Error: Sample Rate: %d Hz must be an integer multiple of Reporting rate: %d FPS', ...
                       FSamp, Fs);
    error(errMsg)

elseif (SettlingTime < (N+1)/FSamp)
    errMsg = sprintf('Error: Settling Time: %f must be greater than the filter window group delay: %f',...
        SettlingTime, (N+1)/FSamp);
    error(errMsg)

else
    if length(Signal(:,1)) < 2*(N+1)
        errMsg = sprintf('Error: Event Signal length: %d must be greater than two filter windows: %d', ...
                    length(Signal(:,1)), ...
                    2 * (N+1) );
        error(errMsg)

    else
        % number of phases      
        Nphases = length(Signal(1,:));
        
        % From Duration and T0 minus the settling time,
        % calculate time vector, add (negative) time at the beginning for the
        % settling time
        Duration = length(Signal(:,1))/FSamp;
        tStart = -SettlingTime;
        tEnd = Duration - SettlingTime;
        t = (tStart:1/FSamp:tEnd);
        t = (t(1:end-1)).';
        
               
        % DFT
        DFT = zeros(length(t),Nphases);
        PosSeq = zeros(length(t),floor(Nphases/3)); % one PosSeq per 3 phases
        for i = 1:Nphases
            DFT(:,i) = sqrt(2) .* Signal(:,i) .* exp(-1i * (2*pi*F0) .* t);
        end      
            
        % get the filter coefficients
        Bn = FIR(N,Fr,FSamp);               % unnormalized coefficients
        Wn = Window(N,WindowType);
        Bn = Bn.*Wn;
        Bn = Bn./sum(Bn);                   % normalized coefficients
        
        % filter the DFT
        for i = 1:Nphases
            DFT(:,i) = filter(Bn,1,real(DFT(:,i))) + 1i*filter(Bn,1,imag(DFT(:,i)));
        end
        
        %figure(1)
        %plot(t,DFT)
        
        %------------------------------------------------------------------
        % Positive Sequence
        for i = 1:floor(Nphases/3)
          phases3 = DFT(:,(((i-1)*3)+1):(((i-1)*3)+3)); 
          PosSeq(:,i) = calcPosSeq(phases3).';
        end
        
     
        % decimate  
        %filterDelay = (2*N)+(N/2);  % The center of the next window after the start        
        Nsynx = floor(length(t)/(FSamp/Fs))- (2*(SettlingTime*Fs))+1 ; % number of synchrophasor reports
        
        Synx = zeros(Nsynx,Nphases);
        ImpPosSeq = zeros(Nsynx,floor(Nphases/3));
        Freq = zeros(Nsynx,1);
        ROCOF = Freq;
        Timestamp = Freq;
        
        kStart = floor(SettlingTime*FSamp+1);
        kEnd = floor(((Duration-SettlingTime)*FSamp)+1);
        
        for j = 1:Nphases  % decimation loop per phase
            i = 1;
            for k = kStart:FSamp/Fs:kEnd % loop per timestamp
                Synx(i,j) = DFT(k+(N/2),j);
                ImpPosSeq(i,:) = PosSeq(k+(N/2),:);
                % timestamp
                Timestamp(i) = t(k) + T0;
                
                % Frequency
                if j == 1       %only get frequency once
                    % Frequency
                    argA = angle(PosSeq((k+(N/2)+1),1));
                    argC = angle(PosSeq((k+(N/2)-1),1));
                    Darg =  argA - argC;
                    if Darg < - pi;
                        argA = argA  + (2*pi);
                    else
                        if Darg > pi
                            argA = argA - (2*pi);
                        end
                    end
                    Darg = argA - argC;
                    Freq(i) = F0 + (Darg /(4*pi*(1/FSamp)));
                    
                    %ROCOF
                    argB = angle(PosSeq((k+(N/2)),1));
                    Sarg = argA + argC;
                    
                    Darg = Sarg - (2*argB);
                    if Darg < -pi
                        argB = argB - (2*pi);
                    else
                        if Darg > pi
                            argB = argB + (2*pi);
                        end
                    end
                    Darg = Sarg - (2*argB);
                    ROCOF(i) = Darg /(2*pi*((1/FSamp)^2));
                    
                end %if
                i = i+1;
            end
        end
        
        %figure(2)
        %plot (Timestamp,Synx)
        
        if (bPosSeq)
        % insert the positive sequence behind each set of 3 phasors 
        tempZero = zeros(Nsynx+1,1);
            for i = 1:floor(Nphases/3)
                insPos = ((i-1)*3)+3+i;
                Synx = [Synx(:,1:insPos-1),ImpPosSeq(:,i),Synx(:,insPos:end)];
            end
        end    
    end % error check
end % error check
%hold off
Timestamp = Timestamp.';   % Transpose when using Matlab script node, do not transpose when using Labview MathScript
%Synx = Synx.';             % Transpose when using Matlab script node, do not transpose when using Labview MathScript
Freq = Freq.';             % Transpose when using Matlab script node, do not transpose when using Labview MathScript
ROCOF = ROCOF.';           % Transpose when using Matlab script node, do not transpose when using Labview MathScript
end %function

