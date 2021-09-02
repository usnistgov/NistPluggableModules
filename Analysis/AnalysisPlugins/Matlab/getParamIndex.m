% function to get the indexes into SignalParams
    function [varargout] = getParamIndex(signalparams)
        for i = 1:nargout
            varargout{i}=signalparams(i,:);
        end
    end

