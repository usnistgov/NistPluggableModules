%Opens all step result files in the current working directory ind performs 
%ETS indexing

clear all

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

data = cell(3,iterations);
for i=1:iterations
    d = readtable(files(i).name);
    d=d(1:end-1,:);    
%     data{1,i} = d{:,2};
%     data{2,i} = d{:,26};
%     data{3,i} = d{:,27};
      data{1,i} = d{:,48};  %debug, look at the reference magnitude
      data{2,i} = d{:,49};
end

t_axis = -n/2*dT:dT:((n/2)-1)*dT;
t_tot = zeros(n,iterations);

for i = 1:iterations
    t_tot(:,i) = t_axis' - (incr*(i-1));
end

t_final = fliplr(t_tot)';
t_final = t_final(:);


val = zeros(n,iterations);
for i = 1:iterations
%    val(:,i) = data{1,i};
    real = data{1,i}; imag = data{2,i};
    val(:,i) = (real.^2+imag.^2).^.5;  %debug, look at the reference magnitude

end

val_final = fliplr(val)';
val_final = val_final(:);
    
[t_sort, i_sort] = sort(t_final);
val_sort = val_final(i_sort);

figure(1)
stem(t_sort,val_sort)
    
