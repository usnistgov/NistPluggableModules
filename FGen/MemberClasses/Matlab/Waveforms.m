% This is a wrapper for PmuWaveforms and FourierWaveforms.

% If signalParams(4,1) is zero of positive, then call PmuWaveforms.
% If signalParams(4,1) is negative, call FourierWaveforms
function [Signal,wfSize] = Waveforms( ...
    t0, ...
    SettlingTime, ...
    sizeMax, ...
    FSamp, ...
    signalparams ...
    )

if signalparams(4,1) >= 0
    [Signal,wfSize] = PmuWaveforms( ...
        t0, ...
        SettlingTime, ...
        sizeMax, ...
        FSamp, ...
        signalparams ...
        );
    return
    
else
    [Signal,wfSize] = FourierWaveforms( ...
        t0, ...
        SettlingTime, ...
        sizeMax, ...
        FSamp, ...
        signalparams ...
        );    
end
