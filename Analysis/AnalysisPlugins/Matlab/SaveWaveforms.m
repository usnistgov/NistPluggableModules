function [] = SaveWaveforms( Y, Timestamp, dt, ActualPts )
%Saves input waveforms in a file names for the timestamp


cd (fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output'))

% convert time in seconds to file name
for i = 1:length(Timestamp)
    P.Timestamp(i) = Timestamp(i);
    P.Y(i,:) = Y(i,:);
    P.dt(i) = dt(i);
    P.ActualPts(i) = ActualPts(i);
end

t = datetime(P.Timestamp(1),'ConvertFrom','epochtime','Epoch','1904-01-01');
v = datevec(t);
name = strcat(num2str(v(1)), ...
                num2str(v(2),'%02.f'), ...
                num2str(v(3),'%02.f'), ...
                num2str(v(4),'%02.f'), ...
                num2str(v(5),'%02.f'), ...
                num2str(v(6),'%02.f'), ...
                '.mat');
save(name,'P');

end

