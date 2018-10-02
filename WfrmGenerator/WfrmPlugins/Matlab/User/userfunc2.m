function [timestamp,synx,freq,ROCOF] = userfunc2(...
                                                   T0,...
                                                   F0,...
                                                   time,...
                                                   signalparams)
% This is an example, user-defined .m file to be called from
% UserEvtWrapper.m switch-case statement.  It shows the 
% freqrampevt.m code as an example of how to create another
% event script.

% INPUTS:
% T0 = 1;             %UTC Timestamp at time 0
% F0 = 60;            %nominal frequency of the synchrophasor
% time = [-1:1/20:1,1.1:1/10:2,2.25:1/4:3.5,3.51:1/100:4];   %time array
% signalparams = [[70,20]     %Vin/Iin (rms magnitudes)
%                 [61,61]     %Fin (Event fundamental freq)
%                 [1,1]       %dF (Event rate of change of frequency)
%                 [0,0]       %V_Pin/I_Pin (Event initial phase offset at time 0 for voltage and current)
%                 [3,3]];     %Tramp (Time (in seconds) from ramp start (time = 0) to ramp end (time = Tramp))
% OUTPUTS:  timestamp[1]
%           synx[2]
%           freq[1]
%           ROCOF[1]

% Start of event description
% Initialize calculation variables
Mag = signalparams(1,:);        %Voltage and current magnitude
Fin = signalparams(2,:);        %Fundamental freq (should be same for voltage and current)
dF = signalparams(3,:);         %ROCOF (should be same for voltage and current)
Pin = signalparams(4,:)/180*pi; %Initial phase offset for voltage and current
Tramp = signalparams(5,:);      %Time (in seconds) from ramp start (time = 0)
                                %to ramp end (time = Tramp), (should be same for voltage and current)

% Precalculate the angular frequencies
W0 = 2*pi*F0;      % Nominal angular frequency
Win = 2*pi*Fin;    % Input fundamental angular frequency

% Generate outputs
timestamp = time + T0;          %Timestamps generated from UTC T0 and time array

% ROCOF = 0 until time = 0, ROCOF = dF for time >= 0 && time <= Tramp
% freq = Fin until time = 0, freq = dF*time+Fin for time >=0 && time <=
% Tramp,
ROCOF = zeros(size(time));
freq = zeros(size(time));
for t = 1:length(time)
    if time(t) < 0
        ROCOF(t) = 0;
        freq(t) = Fin(1);
    else if time(t) <= Tramp(1)
        ROCOF(t) = dF(1);
        freq(t) = dF(1)*time(t)+Fin(1);
        else
            ROCOF(t) = 0;
            freq(t) = dF(1)*Tramp(1)+Fin(1);
        end
    end
end

synx = zeros(length(time),10);  %3 balanced phases and positive sequence voltage
                                %6 phases of current
                                
% Calculate three phases of voltage and place results in columns 1-3 of synx
PS = [0, -2*pi/3, 2*pi/3];      %phase shift for 3 balanced phases
for n = 1:3
       phase = (Win(1)*time)...
              -(W0*time)...
              +(Pin(1)+PS(n));
       for k = 1:length(time)
            if time(k) < 0
                phase(k) = phase(k);
            else if time(k) <= Tramp(1)
                phase(k) = phase(k)+(((dF(1)/2)*2*pi)*(time(k)^2));
                else
                    phase(k) = phase(k)+(((dF(1)/2)*2*pi)*(Tramp(1)^2));
                end
            end
       end
       synx(:,n) = Mag(1).*exp(1i*phase);
end

% Calculate the positive sequence from definition using three phase
% voltages from above
alpha = exp(2/3*pi*1i);
A = [[1,  1,        1]
     [1,  alpha^2,  alpha]
     [1,  alpha,    alpha^2]];
Vabc = (synx(:,1:3)).';     %transpose 3 voltage phases for array multiplication
V012 = A^(-1)*Vabc;         %calculate zero, positive, and negative sequences
synx(:,4) = V012(2,:);      %isolate positive sequence (V1) in 4th column of synx

% Calculate six phases of current (wye = cols 5-7, delta = cols 8-10)

PS = [0, -2*pi/3, 2*pi/3];      %phase shift for 3 balanced phases
for n = 1:3
       phase = (Win(2)*time)...
              -(W0*time)...
              +(Pin(2)+PS(n));
       for k = 1:length(time)
            if time(k) < 0
                phase(k) = phase(k);
            else if time(k) <= Tramp(2)
                phase(k) = phase(k)+(((dF(1)/2)*2*pi)*(time(k)^2));
                else
                    phase(k) = phase(k)+(((dF(1)/2)*2*pi)*(Tramp(2)^2));
                end
            end
       end
       synx(:,n+4) = Mag(2).*exp(1i*phase);
       synx(:,n+7) = sqrt(3)*Mag(2).*exp(1i*phase);
end