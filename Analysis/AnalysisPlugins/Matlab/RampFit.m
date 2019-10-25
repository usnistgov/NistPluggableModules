function [Synx,Freq,ROCOF,iterations] = RampFit ( ...
    SignalParams, ...
    DelayCorr, ...
    MagCorr, ...
    F0, ...
    AnalysisCycles, ...
    SampleRate, ...
    Samples ...
    )

%SignalParams: array of doubles
% index     Parameter
%    0      Starting Frequency
%    1      ROCOF
fGuess = SignalParams(1);
dfGuess = SignalParams(2);

fitCrit = 1e-5;
maxIter = 20;

[NPhases,N] = size(Samples);
dt = 1/SampleRate;
t = linspace(-N/2*dt,N/2*dt,N);     % time vector

%pre-allocate arrays
Ain = zeros(1,NPhases);
phi = zeros(1,NPhases);
Freqs = zeros(1,NPhases);
dFreqs = zeros(1,NPhases);
iterations = zeros(1,NPhases);

% for each phase
for p = 1:NPhases
    % Generate the intial model
    x = Samples(p,:)';
    theta = (pi*(2*fGuess*t)+(dfGuess*t.^2));
    H = [ones(1,N)' cos(theta)' sin(theta)'];
    
    %Traditional Least Squares Linear Fit
    S = (H'*H)\(H'*x);
    A = S(2); B = S(3);
    
    % Four Parameter Cosine Fit (assumes dfGuess is exact)
    % TODO:  Later try using Powell's Method to optimize on F and
    % dF
    f = fGuess;
    dF = dfGuess;
    for k = 1:maxIter
        theta = (pi*(2*f*t)+(dF*t.^2));
        H = [ones(1,N)' cos(theta)' sin(theta)'];
        G = [H (-A*t.*sin(theta)+B*t.*cos(theta))'];
        S = (G'*G)\(G'*x);
        A=S(2); B=S(3);
        deltaF = S(size(S,1))/(2*pi);
        f = f + deltaF;
        
        % exit criterion
        if abs(deltaF) < fitCrit
            break
        elseif k > maxIter
            msg = sprintf('Fitter exceeded %d iterations. deltaF = %f, threshold = %f', ...
                k, deltaF, fitCrit);
            error(msg);
        end
    end
    
    iterations(p) = k;
    Ain(p) = sqrt(A^2+B^2); %TODO: Multiply by MagCorr(p)
    phi(p) = atan2(B,A);    %TODO: Add DelayCorr(p)*1e-9*2*pi*fh;
    Freqs(p) = f;
    dFreqs(p) = dfGuess;    %TODO: Assumes that dfGuess is correct.  
end

Synx = Ain/sqrt(2).*exp(-1i.*phi);

%Calculating symmetrical components
if NPhases > 2
    alfa = exp(2*pi*1i/3);
    Ai = (1/3)*[1 1 1; 1 alfa alfa^2; 1 alfa^2 alfa];
    
    Vabc = Synx(1:3);
    Vzpn = Ai*Vabc'; %voltage: zero, positive and negative sequence
    
    if NPhases > 5
        Iabc = Synx(4:6);
        Izpn = Ai*Iabc'; %curren: zero, positive and negative sequence
        
        %Synx output:
        Synx = [ Vabc Vzpn(2) Iabc Izpn(2)];
    else
        Synx = [Vabc.' Vzpn(2)];
    end
    
    Freq = mean(Freqs(1:3)); % average of the voltage frequencies
    ROCOF = mean(dFreqs(1:3));
else
    Freq = Freqs;
    ROCOF = dfGuess;
end

end
