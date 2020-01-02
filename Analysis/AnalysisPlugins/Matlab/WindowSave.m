function [ ...
        WinT0, ...
        WindowOut, ...
        TimeStamp, ...
        RemainingSamples, ...
        RemainingTime, ...
        Valid, ...
        Continue] = ...
    WindowSave (...
        WinT0, ...
        WindowIn, ...             % Window Sample Data
        WindowTime, ...         % The time at the CENTER of the window    
        SettlingTime, ...
        F0, ...                 % Nominal Frequency
        AnalysisCycles, ...     % Number of Cycles to Analyse             
        AnalysisTime, ...       % Time to Analyse (will be at the center of the Window)
        Y, ...                  % Incoming Samples
        dt, ...                 % Sample Period
        SampleT0)                     % Time of the first sample in Y

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
% if exist(name,'file')
%     A = open(name);
%     P = A.P;
%     clear A;
% else
    P = struct('WinT0',{},'WindowIn',{},'WindowTime',{},'SettlingTime',{},'F0',{},'AnalysisCycles',{},'AnalysisTime',{},'Y',{},'dt',{},'SampleT0',{});
% end
    P(1).WinT0 = WinT0;
    P(1).WindowIn = WindowIn;
    P(1).WindowTime = WindowTime;
    P(1).SettlingTime = SettlingTime;
    P(1).F0 = F0;
    P(1).AnalysisCycles = AnalysisCycles;
    P(1).AnalysisTime = AnalysisTime;
    P(1).Y = Y;
    P(1).dt = dt;
    P(1).SampleT0 = SampleT0;
    
    [ ...
        WinT0, ...
        WindowOut, ...
        TimeStamp, ...
        RemainingSamples, ...
        RemainingTime, ...
        Valid, ...
        Continue] = ...
    WindowBuild (...
        WinT0, ...
        WindowIn, ...             % Window Sample Data
        WindowTime, ...         % The time at the CENTER of the window    
        SettlingTime, ...
        F0, ...                 % Nominal Frequency
        AnalysisCycles, ...     % Number of Cycles to Analyse             
        AnalysisTime, ...       % Time to Analyse (will be at the center of the Window)
        Y, ...                  % Incoming Samples
        dt, ...                 % Sample Period
        SampleT0);                    % Time of the first sample in Y
    
    P(1).WindowOut = WindowOut;
    P(1).TimeStamp = TimeStamp;
    P(1).RemainingSamples = RemainingSamples;
    P(1).RemainingTime = RemainingTime;
    P(1).Valid = Valid;
    P(1).Continue = Continue;
    
    if exist(name,'file')
        matObj = matfile(name,'Writable',true);
        matObj.P(end+1,1) = P;
     else        
       save(name,'P')
   end
        
end

