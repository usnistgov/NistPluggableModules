function window = getWindow(obj,offset,analysisCycles,varargin)
% return a timeseries which is a subset of the timeseries data of length analysisCycles*Fs/F0
% offset is the number of nominal cycles to the start index, if the end of the data
% is reached, the data wraps and data from the beginning of the ts is
% fetched. Think of the timeseries data as a circular buffer, the offset
% can be multiples of the data that is in the ts.
    
    nWindow = analysisCycles*obj.SampleRate/obj.F0;
    
    if nargin > 3
        if strcmp(varargin{1},'odd')
            nWindow = nWindow+1;
        end
    end
    
    nData = size(obj.Ts.Data,1);
    startIndex = mod(offset*obj.SampleRate/obj.F0,nData)+1; 
    
    % If the time series contains enough data:
    if (nData-(startIndex-1)) >= nWindow
        window = obj.Ts.Data(startIndex:nWindow+(startIndex-1),:);
    else
        % not enough data in the Ts. wrap and concatinate
        W = obj.Ts.Data(startIndex:end,:);
        while length(W) < nWindow
            nRemaining = nWindow - length(W);
            if nRemaining >= nData
               W = vertcat(W,obj.Ts.Data);
            else
               W = vertcat(W,obj.Ts.Data(1:nRemaining,:));
            end
            window = W;
        end
        %plot(real(window))
    end
    
    % We now have the data, make it a timeseries  
    N = size(window,1);
    %t = (0:(n-1))/obj.SampleRate; % time vector starting at 0
    %t = t - (n-1)/(2*obj.SampleRate);
    t = linspace(-(N/2),(N/2)-1,N)/obj.SampleRate;
    %t = (-(N/2-(1/2)):N/2-(1/2))/obj.SampleRate;
    window = timeseries(window,t);    % timeseries creation with data
    
    % The timeseries userdata will contain a structure with the value at
    % time = 0 (the window center).  It will also hold the frequency and ROCOF
    % at that time.  
    idx = floor(N/2)+1; % center of the window
    vals = window.Data(idx-3:idx+3,:);
    midVals = vals(4,:);
    phi = angle(vals);
    freqs = diff(unwrap(phi))*obj.SampleRate/(2*pi);
    ROCOFS = diff(freqs)*obj.SampleRate;
    tVals = linspace(-3,3,6)/obj.SampleRate;
    freqs = interp1(tVals,freqs,0,'PCHIP');
    ROCOFS = ROCOFS(3,:);
    
    window.UserData = struct('Vals',midVals,'Freqs',freqs,'ROCOFs',ROCOFS);
        
        
    
    


end