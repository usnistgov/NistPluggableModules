function [Results] = PmuResults (...
    SignalParams, ...
    PmuTS, ...
    PmuSynx, ...
    PmuFreq, ...
    PmuROCOF, ...
    RefTS, ...
    RefSynx, ...
    RefFreq, ...
    RefROCOF ...
    )

% % --------------------------- DEBUG---------------------------------
% % Save the workspace data to file
% name = fullfile(getenv('USERPROFILE'),'Documents','PMUCAL','Output','SavedResults.mat');
% if exist(name,'file')
%     A = open(name);
%     P = A.P;
%     clear A;
% else
%     P = struct('SignalParams', {}, 'PmuTS', {}, 'PmuSynx', {}, 'PmuFreq', {}, 'PmuROCOF', {}, 'RefTS', {}, 'RefSynx', {}, 'RefFreq', {}, 'RefROCOF', {} );
% end
% 
% n = length(P)+1;
% P(n).SignalParams=SignalParams;
% P(n).PmuTS=PmuTS;
% P(n).PmuSynx=PmuSynx;
% P(n).PmuFreq=PmuFreq;
% P(n).PmuROCOF=PmuROCOF;
% P(n).RefTS=RefTS;
% P(n).RefSynx=RefSynx;
% P(n).RefFreq=RefFreq;
% P(n).RefROCOF=RefROCOF;
% 
% save(name,'P');
% 
% %-----------------------------------------------------------------------

% Creates a 1D array of double the will be written into the PMU report
Fh = SignalParams(4,1);
Kh = SignalParams(6,1);

nPhases = length(PmuSynx);
% timestamp at the start 
% for each phase (including positive sequence), there will be TVE,Me,Pe.
%  FE and RFe
%  pmu timestamp
%  real and imaginary for each pmu phase
%  PMU F and ROCOF
%  ref timestamp
%  Real and imaginary for each ref phase
%  Ref F and ROCOF
% If there are harmonics or interharmonics
%       Real and imaginary for each phase not including positive sequence
%

numCol = 1 + (nPhases*3) + 2 ...
        + 1 + (nPhases*2) + 2 ...
        + 1 + (nPhases*2) + 2 ;
if Kh ~= 0
    % If there are harmonics or interharmonics, there will be a frequency and real and
    % imaginary for each phase
    ISynx = RefSynx(nPhases+1:end);
    RefSynx = RefSynx(1:nPhases);
    numCol = numCol + 1 + (length(ISynx)*2);   
end
Results = zeros(1,numCol);


% Timestamp
loc = 1;
Results(1,loc) = PmuTS;     

% Calculated results
loc = loc+1;
Res = zeros(3,nPhases);
Res(1,:) = sqrt( ((real(PmuSynx) - real(RefSynx)).^2 + (imag(PmuSynx) - imag(RefSynx)).^2)...
             ./ ((real(RefSynx)).^2 + (imag(RefSynx)).^2))...
             * 100;  % TVE (in percent)

Res(2,:) = ((abs(PmuSynx) - abs(RefSynx)) ./ abs(RefSynx)) .* 100;  % ME in percent
Res(3,:) = angle(PmuSynx) - angle(RefSynx);  % PE in radians        
Results(1,loc : (loc + (nPhases * 3) - 1)) = reshape(Res,[1,length(PmuSynx)*3]);

loc = loc + (nPhases * 3);
Results(1,loc) = PmuFreq - RefFreq;
loc = loc + 1;
Results(1,loc) = PmuROCOF - RefROCOF;

% Timestamp
loc = loc+1;
Results(1, loc) = PmuTS;

% PMU values
loc = loc + 1;      % location of the PMU Timestamp
Synx = zeros(2,length(PmuSynx)); 
Synx(1,:) = real(PmuSynx);
Synx(2,:) = imag(PmuSynx);
Results(1,loc:loc+(2*nPhases)-1) = reshape(Synx,[1,length(Synx)*2]);

loc = loc+(2*nPhases);
Results(1,loc) = PmuFreq;
loc = loc+1;
Results(1,loc) = PmuROCOF;

% Timestamp
loc = loc + 1;
Results(1,loc) = RefTS;

% Reference Values
loc = loc+1;
Synx = zeros(2,length(RefSynx));
Synx(1,:) = real(RefSynx);
Synx(2,:) = imag(RefSynx);
Results(1,loc:loc+(2*nPhases)-1) = reshape(Synx,[1,length(Synx)*2]);
loc = loc+(2*nPhases);
Results(1,loc) = RefFreq;
loc = loc+1;
Results(1,loc) =  RefROCOF;

if Kh ~= 0
   loc = loc+1;
   Results(1,loc)=Fh; 
   Synx = zeros(2,length(ISynx)); 
   Synx(1,:) = real(ISynx);
   Synx(2,:) = imag(ISynx);
   loc = loc+1;
   Results(1,loc:end) = reshape(Synx,[1,length(Synx)*2]);
end

% 
end

