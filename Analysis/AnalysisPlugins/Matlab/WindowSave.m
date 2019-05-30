function [ ...
        WindowOut, ...
        TimeStamp, ...
        RemainingSamples, ...
        RemainingTime, ...
        Valid, ...
        Continue] = ...
    WindowSave (...
        WindowIn, ...             % Window Sample Data
        WindowTime, ...         % The time at the CENTER of the window    
        F0, ...                 % Nominal Frequency
        AnalysisCycles, ...     % Number of Cycles to Analyse             
        AnalysisTime, ...       % Time to Analyse (will be at the center of the Window)
        Y, ...                  % Incoming Samples
        dt, ...                 % Sample Period
        t0)                     % Time of the first sample in Y

% Display the timestamps
% format = 'dd-MMM-uuuu HH:mm:ss.SSS';
% t0_dt = datetime(t0, 'ConvertFrom', 'epochtime', 'Epoch', '1904-01-01');
% t0_dt.Format = format;
% W_dt = datetime(WindowTime, 'ConvertFrom', 'epochtime', 'Epoch', '1904-01-01');
% W_dt.Format = format;
% A_dt = datetime(AnalysisTime, 'ConvertFrom', 'epochtime', 'Epoch', '1904-01-01');
% A_dte.Format = format;

% msgA = sprintf ('A_dt: %s',char(A_dt));
% msgW = sprintf ('W_dt: %s',char(W_dt));
% msgT = sprintf ('t0_dt: %s',char(t0_dt));
% msg = sprintf ('A_dt: %s\nt0_dt: %s',char(A_dt), char(t0_dt));
% msgbox(msg)

cd('C:\Users\PowerLabNI3\Documents\PMUCAL\Output')
name = 'SavedWindow.mat';
if exist(name,'file')
    A = open(name);
    P = A.P;
    clear A;
else
    P = struct('WindowIn',{},'WindowTime',{},'F0',{},'AnalysisCycles',{},'AnalysisTime',{},'Y',{},'dt',{},'t0',{});
end
    n = length(P);
    P(n+1).WindowIn = WindowIn;
    P(n+1).WindowTime = WindowTime;
    P(n+1).F0 = F0;
    P(n+1).AnalysisCycles = AnalysisCycles;
    P(n+1).AnalysisTime = AnalysisTime;
    P(n+1).Y = Y;
    P(n+1).dt = dt;
    P(n+1).t0 = t0;
    
    [ ...
        WindowOut, ...
        TimeStamp, ...
        RemainingSamples, ...
        RemainingTime, ...
        Valid, ...
        Continue] = ...
    WindowBuild (...
        WindowIn, ...             % Window Sample Data
        WindowTime, ...         % The time at the CENTER of the window    
        F0, ...                 % Nominal Frequency
        AnalysisCycles, ...     % Number of Cycles to Analyse             
        AnalysisTime, ...       % Time to Analyse (will be at the center of the Window)
        Y, ...                  % Incoming Samples
        dt, ...                 % Sample Period
        t0);                    % Time of the first sample in Y
    
    P(n+1).WindowOut = WindowOut;
    P(n+1).TimeStamp = TimeStamp;
    P(n+1).RemainingSamples = RemainingSamples;
    P(n+1).RemainingTime = RemainingTime;
    P(n+1).Valid = Valid;
    P(n+1).Continue = Continue;
    
    save(name,'P')
    
end

