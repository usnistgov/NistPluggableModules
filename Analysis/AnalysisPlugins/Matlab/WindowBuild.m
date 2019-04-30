function [ ...
        WindowData, ...
        WindowTime, ...
        RemainingSamples, ...
        RemainingTime, ...
        Valid, ...
        Continue] = ...
    WindowBuild (...
        WindowData, ...             % Window Sample Data
        WindowTime, ...         % The time at the CENTER of the window    
        F0, ...                 % Nominal Frequency
        AnalysisCycles, ...     % Number of Cycles to Analyse             
        AnalysisTime, ...       % Time to Analyse (will be at the center of the Window)
        Y, ...                  % Incoming Samples
        dt, ...                 % Sample Period
        t0)                     % Time of the first sample in Y

Valid = 'f';
Continue = 't';
RemainingSamples = [];
RemainingTime = [];

% The number of samples in the window
nWindow = round(AnalysisCycles/(dt(1)*F0));

nSamplesNeeded = round((AnalysisTime - WindowTime)/dt(1));
if nSamplesNeeded >= nWindow
    WindowData = [];
    WindowTime = AnalysisTime;
    nSamplesNeeded = nWindow;
else    % if the Window is full, then remove the old samples from the beginning
    WindowData = WindowData(nSamplesNeeded+1:end,:);
    WindowTime = WindowTime + nSamplesNeeded * dt(1);
end


% determine the timestamp that we need
timeStampNeeded = (nWindow/2-nSamplesNeeded)*dt(1)+AnalysisTime;

% find the index of the first needed sample of Y
%   This assumes that t0(1) is the time of the first sample of Y
nY = length(Y);
iY = round((timeStampNeeded - t0(1))/dt(1))+1; 

% if iY is negative, the AnalysisTime is before the data started
% so put the data back into the queue and wait for the next analysis time
if iY < 0
    Continue = 'f';
    RemainingSamples = Y;
    RemainingTime = t0;
    return
end

% The needed sample is not in Y.  Return and continue with the next Y
if iY >= nY
    return
end

% Delete the unneeded samples from Y and adjust t0(1)
Y = Y(iY:end,:);
nY = length(Y);
t0(1) = timeStampNeeded;

% if there are enough samples in Y, then use them, if not, use what is
% there and continue to the next Y.
if nSamplesNeeded <= nY
    WindowData = vertcat(WindowData,Y(1:nSamplesNeeded,:));
    WindowTime = AnalysisTime;    
    RemainingSamples = Y(nSamplesNeeded+1:end,:);
    RemainingTime = t0(1) + nSamplesNeeded*dt(1);
    Valid = 't';
    Continue = 'f';
    return
else
    WindowData = vertcat(WindowData,Y);
    WindowTime = WindowTime + nY*dt(1);
    RemainingSamples = [];
    RemainingTime = 0;
    Valid = 'f';
    Continue = 't';   
end    

end