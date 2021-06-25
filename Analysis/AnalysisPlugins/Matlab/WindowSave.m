function WindowSave (...
    WindowTime, ...
    Window, ...
    T0, ...
    Valid ...
    )

path = fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output','SavedWindow.mat');

P = struct('WindowTime',{},'Window',{},'WinT0',{},'Valid',{});
P(1).WindowTime = WindowTime; 
P(1).Window = Window;
P(1).WinT0 = T0;
P(1).Valid = Valid;

if exist(path,'file')
    matObj = matfile(path,'Writable',true);
    matObj.P(end+1,1) = P;
else
    save(path,'P')
end

end

