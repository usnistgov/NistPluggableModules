% function to get the indexes into SignalParams
    function [varargout] = getParamIndex()
        for i = 1:nargout
            varargout{i}= i;
        end
    end

% Signal params.  Note that the labeling convention comes mostly from the
% standard
%     Xm = SignalParams(1,:)*sqrt(2);     % phase amplitude (given by the user in RMS
%     Fin = SignalParams(2,:);    % frequency (must be the same for all 6 channels or an error will be thrown
%     Ps = SignalParams(3,:);     % phase
%     Fh = SignalParams(4,:);     % Frequency of the interfering signal
%     Ph = SignalParams(5,:);     % Phase of the interfering signal
%     Kh = SignalParams(6,:);     % index of the interfering signal
%     Fa = SignalParams(7,:);     % phase (angle) moduation frequency
%     Ka = SignalParams(8,:);     % phase (angle) moduation index
%     Fx = SignalParams(9,:);     % amplitude moduation frequency
%     Kx = SignalParams(10,:);     % amplitude moduation index
%     Rf = SignalParams(11,:);     % ROCOF
%     KaS = SignalParams(12,:);   % phase (angle) step index
%     KxS = SignalParams(13,:);   % magnitude step index
%     KfS = SignalParams(14,:);   % frequency step index
%     KrS = SignalParams(15,:)    % ROCOF step index (same as Rf)
%     KrS = SignalParams(15,:)    % ROCOF step index (same as Rf)
