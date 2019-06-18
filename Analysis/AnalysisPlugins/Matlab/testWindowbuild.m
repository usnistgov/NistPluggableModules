clear all;
% load ('bar.mat');
% 
% RemainingSamples = Y;
% RemainingTime = t0;
% WindowTime = 0;

% spd = 24*60*60;     % seconds per day because matlab times are in fractional days since epoch
% WindowTime = round((now)*spd);
% AnalysisTime = WindowTime+0.02;
% dt = .001;
% AnalysisCycles = 4;
% F0 = 50;
% t = (0:dt:AnalysisCycles/(F0)-dt);
% WindowIn = [cos(2*pi*F0*t)]';
% Y = WindowIn;
% t0 = WindowTime+((AnalysisCycles/2)/F0);
% 
% msg = sprintf('WindowTime = %s',datestr(datenum(WindowTime/spd),'HH:MM:SS.FFF'));
% disp(msg)
% msg = sprintf('AnalysisTime = %s',datestr(datenum(AnalysisTime/spd),'HH:MM:SS.FFF'));
% disp(msg)
% msg = sprintf('t0 = %s',datestr(datenum(t0/spd),'HH:MM:SS.FFF'));
% disp(msg)

path = 'C:\Users\PowerLabNI3\Documents\PMUCAL\Output\';
name = 'SavedWindow.mat';
name = strcat(path,name);

A = open(name);
P = A.P;
clear A;


for i = 1:length(P)
    Samples(i).Y = P(i).Y;
    Samples(i).dt = P(i).dt;
    Samples(i).t0 = P(i).t0;
    Sensor(i).AnalysisTime = P(i).AnalysisTime;
end
WindowIn = P(1).WindowIn;
WindowTime = P(1).WindowTime;
F0 = P(1).F0;
AnalysisCycles = P(1).AnalysisCycles;
clear P;

j = 1; 
for i = 1:length(Sensor)
   AnalysisTime = Sensor(i).AnalysisTime;
   Y = Samples(j).Y;
   dt = Samples(j).dt;
   t0 = Samples(j).t0;
   
 % display the WindowTime, t0, and the AnalysisTime
    format = 'dd-MMM-uuuu HH:mm:ss.SSS';
    A_DateTime = datetime(AnalysisTime, 'ConvertFrom', 'epochtime', 'Epoch', '1904-01-01');
    A_DateTime.Format = format;
    W_DateTime = datetime(WindowTime, 'ConvertFrom', 'epochtime', 'Epoch', '1904-01-01');
    W_DateTime.Format = format;
    t0_DateTime = datetime(t0(1), 'ConvertFrom', 'epochtime', 'Epoch', '1904-01-01');
    t0_DateTime.Format = format;
    
    
    
    msgA = sprintf ('tA: %s',char(A_DateTime));
    msgW = sprintf ('tW: %s',char(W_DateTime));
    msgT = sprintf ('t0: %s',char(t0_DateTime));
    disp(msgA)
    disp(msgW)
    disp(msgT)



    
    [WindowOut, ...
        TimeStamp, ...
        RemainingSamples, ...
        RemainingTime, ...
        Valid, ...
        Continue] = ...
        WindowBuild (...
        WindowIn, ...
        WindowTime, ...
        F0, ...
        AnalysisCycles, ...
        AnalysisTime, ...
        Y, ...
        dt, ...
        t0);
    
    plot(WindowOut')
    WindowIn = WindowOut;
    WindowTime = TimeStamp;
    
    j=j+1;
    if ~isempty(RemainingSamples);
        Samples(j).Y = RemainingSamples;
        Samples(j).t0 = RemainingTime;
    end
    
    
end
