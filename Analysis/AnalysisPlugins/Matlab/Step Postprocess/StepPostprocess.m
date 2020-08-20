%Opens all step result files in the current working directory ind performs 
%ETS indexing

clear all
fig = 0;

%% List of the files to be processed
names = dir;
ii = 1;     %file pointer
for i = 1:length(names)
    % check if name is a file or a folder
    if ~names(i).isdir; files(ii) = names(i); ii = ii+1; end
end
clear names  % remove the list from memory
iterations = length(files);

% get the time series of the first file
d = readtable(files(1).name);
VariableNames = d.Properties.VariableNames;
d=d(1:end-1,:);
timeStamp = d{:,1};
n = length(timeStamp);   % number of reports per file
dT = mean(diff(timeStamp));
incr = dT/iterations; % the step delay increment each iteration 

numVal =size(d,2);

data = cell(numVal,iterations);
for i=1:iterations
    d = readtable(files(i).name);
    d=d(1:end-1,:);     % the last line is a repeat
    for j = 1:size(d,2)
        data{j,i} = d{:,j};

    end
end
clear d     % no need to keep the table in memory

%% Time series
t_axis = -n/2*dT:dT:((n/2)-1)*dT;   % time axis of non-ETS
t_tot = zeros(n,iterations);

val = zeros(n,iterations,numVal);
for i = 1:iterations
    t_tot(:,i) = t_axis' - (incr*(i-1));
    
    for j = 1:numVal
        val(:,i,j) = data{j,i}; 
    end   
end

% Create an ETS time array and indicees into each iteration
t_final = fliplr(t_tot)';
t_final = t_final(:);
[t_sort, i_sort] = sort(t_final);

%% interlace the columns
val_sort = zeros(n*iterations,numVal);
for i = 1:numVal
    final = val(:,:,i);
    final = fliplr(final)';
    final = final(:);
    val_sort(:,i) = final(i_sort);
    %------------------ visualization ------------------------------------
    fig = fig+1; figure(fig)
    plot (t_sort,val_sort(:,i))
    title(VariableNames(i));
    %---------------------------------------------------------------------
end
    



%% Output file
d = cell2table(repmat({NaN},n*iterations,numVal));
d.Properties.VariableNames = VariableNames;
d{:,:} = val_sort;
% Replace the timestamp columns with the time series
d{:,1} = t_sort;d{:,28} = t_sort;d{:,47} = t_sort;

%Write the table to a file
fileName=files(1).name; fileName =  strcat(fileName(1:end-4),'_interlaced.csv');
writetable(d,fileName)

%%----------- debug, look at the reference magnitude-----------------
mag = zeros(n,iterations);
for i=1:iterations
    real = data{48,i}; imag = data{49,i};   %Ref_VA
    mag(:,i) = (real.^2+imag.^2).^0.5;
end
mag = fliplr(mag)';
mag_sort = mag(:);
mag_sort = mag_sort(i_sort);
fig = fig+1; figure(fig)
stem (t_sort,mag_sort);
%-------------------------------------------------------------------



    
