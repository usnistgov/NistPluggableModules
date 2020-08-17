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
d=d(1:end-1,:);
timeStamp = d{:,1};
n = length(timeStamp);   % number of reports per file
dT = mean(diff(timeStamp));
incr = dT/iterations; % the step delay increment each iteration 

numVal =3;

data = cell(numVal+1,iterations);
real = zeros(n,iterations); imag = real;  % for debugging-----------------
for i=1:iterations
    d = readtable(files(i).name);
    d=d(1:end-1,:);    
     data{1,i} = d{:,2};
     data{2,i} = d{:,26};
     data{3,i} = d{:,27};
     %----------- debug, look at the reference magnitude-----------------
     real(:,i) = d{:,48};
     imag(:,i) = d{:,49};
     %-------------------------------------------------------------------
end
clear d     % no need to keep the table in memory

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


val_sort = zeros(n*iterations,numVal);
for i = 1:numVal
    final = val(:,:,i);
    final = fliplr(final)';
    final = final(:);
    val_sort(:,i) = final(i_sort);
    fig = fig+1; figure(fig)
    stem (t_sort,val_sort(:,i))
end
    
%----------- debug, look at the reference magnitude-----------------
mag = zeros(n,iterations);
for i=1:iterations
    mag(:,i) = (real(:,i).^2+imag(:,i).^2).^0.5;
end
mag = fliplr(mag)';
mag_sort = mag(:);
mag_sort = mag_sort(i_sort);
fig = fig+1; figure(fig)
stem (t_sort,mag_sort);
%-------------------------------------------------------------------



    
