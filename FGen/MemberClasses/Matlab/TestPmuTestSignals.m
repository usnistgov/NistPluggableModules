t0 = 0;
SettlingTime = 1;
FSamp = 800;
size = 8000;
SignalParams = zeros(13,3);
SignalParams(1,:) = 1;
SignalParams(2,:) = 1;
SignalParams(3,:) = [0,-120,120];
SignalParams(11,:) = 1;




[Signal] = PmuTestSignals( ...
    t0, ...
    SettlingTime, ...
    size, ...
    FSamp, ...
    SignalParams ...
    );
plot(Signal(1,:));