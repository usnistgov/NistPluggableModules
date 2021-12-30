function window = getWindow(obj,offset,analysisCycles,varargin)
% return a timeseries which is a subset of the timeseries data of length analysisCycles*Fs/F0
% offset is the number of nominal cycles to the start index, if the end of the data
% is reached, the data wraps and data from the beginning of the ts is
% fetched. Think of the timeseries data as a circular buffer, the offset
% can be multiples of the data that is in the ts.
    
    nWindow = ceil(analysisCycles*obj.SampleRate/obj.F0);
    
    if nargin > 3
        if varargin{1} ~= true
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
    %   Since the window may be even or odd, the time t=0 may not acutuall
    %   appear in the window.  If odd it does and we will need to
    %   interplate the frequency and ROCOF from surrounding values.  If the
    %   window is even, then the 0 value does not appear in the window and
    %   we need to interpolate the complex value at 0.
    idx = floor(N/2); % center of the window
    % if the window is odd sized, then the 0 is at the center (idx+1), if
    % not, then interpolate the center value
    even = ~rem(N,2)==1;
    if even  % if true, the size is even,
        nVals = 5;
        vals = window.Data(idx+(1-floor(nVals/2)):idx+(1+floor(nVals/2)),:);
        tVals = window.Time(idx+(1-floor(nVals/2)):idx+(1+floor(nVals/2)),:);
        midVals = vals(floor(nVals/2)+1,:);
        phi = angle(vals);
        phiDiff = diff(unwrap(phi))*obj.SampleRate/(2*pi);
        tVals = (tVals(1:end-1,:) + tVals(2:end,:))/2;
        fDiff = diff(phiDiff)./diff(tVals);
        freqs = interp1(tVals,phiDiff,0,'PCHIP');
        ROCOFS = fDiff(floor(nVals/2),:);     % get the center value
        
    else  % if odd
        nVals = 6;
        vals = window.Data(idx+2-floor(nVals/2):idx+1+floor(nVals/2),:);
        tVals = window.Time(idx+2-floor(nVals/2):idx+1+floor(nVals/2),:);
        midVals = interp1(tVals,vals,0,'PCHIP');
        phi = angle(vals);
        phiDiff = diff(unwrap(phi))*obj.SampleRate/(2*pi);
        freqs = phiDiff(floor(nVals/2),:); 
        tVals = (tVals(1:end-1,:) + tVals(2:end,:))/2;
        fDiff = diff(phiDiff)./diff(tVals);
        tVals = (tVals(1:end-1,:) + tVals(2:end,:))/2;
        ROCOFS = interp1(tVals,fDiff,0,'PCHIP');     % interpolate     
    end
%     if even
%         tVals = (tVals(1:end-1,:) + tVals(2:end,:))/2;
%         midVals = vals(floor(nVals/2)+1,:);
%     else
%         midVals = interp1(tVals,vals,0,'PCHIP');
%         tVals = (tVals(1:end-1,:) + tVals(2:end,:))/2;        
%     end
    
    
%     % if the window is even, need to interpolate freqs and ROCOF
%     if even
%         %freqs = phiDiff(floor(nVals/2),:); % Get the center value
%         %ROCOFS = interp1(tVals,fDiff,0,'PCHIP'); % interpolate
%         freqs = interp1(tVals,phiDiff,0,'PCHIP');
%         ROCOFS = fDiff(floor(nVals/2),:);     % get the center value
%     else
%         freqs = phiDiff(floor(nVals/2)+1,:); % Get the center value
%         ROCOFS = interp1(tVals,fDiff,0,'PCHIP'); % interpolate
%         %freqs = interp1(tVals,phiDiff,0,'PCHIP');
%         %ROCOFS = fDiff(floor(nVals/2),:);     % get the center value
%         
%     end
    
    
    window.UserData = struct('Vals',midVals,'Freqs',freqs,'ROCOFs',ROCOFS);        
        
    
    


end
