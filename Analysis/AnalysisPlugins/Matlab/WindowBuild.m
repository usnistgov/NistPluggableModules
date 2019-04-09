function [ ...
        Window, ...
        WindowTime, ...
        RemainingSamples, ...
        RemainingTime, ...
        Valid, ...
        Continue] = ...
    WindowBuild (...
        Window, ...             % Window Sample Data
        WindowTime, ...         % The time at the CENTER of the window    
        F0, ...                 % Nominal Frequency
        AnalysisCycles, ...     % Number of Cycles to Analyse             
        AnalysisTime, ...       % Time to Analyse (will be at the center of the Window)
        Y, ...                  % Incoming Samples
        dt, ...                 % Sample Period
        t0, ...                 % Time of the first sample in Y
        numPhases )             % Number of columns in Window and Y


% The number of samples in the window
nWindow = round(AnalysisCycles/(dt*F0));


nSamplesNeeded = round((AnalysisTime - WindowTime)/dt);
if nSamplesNeeded >= nWindow
    Window = [];
    WindowTime = 0;
    nSamplesNeeded = nWindow;
else    % if the Window is full, then remove the old samples from the beginning
    Window = Window(nSamplesNeeded+1:end,:);
    WindowTime = WindowTime + nSamplesNeeded * dt;
end


% determine the timestamp that we need
timeStampNeeded = (nWindow/2-nSamplesNeeded)*dt+AnalysisTime;

% find the index of the first needed sample of Y
%   This assumes that t0 is the time of the first sample of Y
nY = length(Y);
iY = round((timeStampNeeded - t0)/dt)+1; 

% The needed sample is not in Y.  Return and continue with the next Y
if iY >= nY
    Valid = 'f';
    Continue = 't';
    RemainingSamples = [];
    RemainingTime = [];
    return
end

% Delete the unneeded samples from Y and adjust t0
Y = Y(iY:end,:);
nY = length(Y);
t0 = timeStampNeeded;

% if there are enough samples in Y, then use them, if not, use what is
% there and continue to the next Y.
if nSamplesNeeded <= nY
    Window = vertcat(Window,Y(1:nSamplesNeeded,:));
    WindowTime = AnalysisTime;    
    RemainingSamples = Y(nSamplesNeeded+1:end,:);
    RemainingTime = t0 + nSamplesNeeded*dt;
    Valid = 't';
    Continue = 'f';
    return
else
    Window = vertcat(Window,Y);
    WindowTime = WindowTime + nY*dt;
    RemainingSamples = [];
    RemainingTime = 0;
    Valid = 'f';
    Continue = 't';   
end    

end