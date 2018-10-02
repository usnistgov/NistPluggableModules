T0 = 0;
F0 = 60;
fs = F0*128;
time = 0:1/fs:(5/F0);

Xm = [1,1,1];
Fin = [60,60,60];
Pin = [0,-120,120];
nh = [5,5,5];
nhp = [5,5,5];
Kh = [.1,.1,.1];

signalparams = [Xm;Fin;Pin;nh;nhp;Kh];

EvtType = '60255Harm';

[Signal] = UserEvtSigWrapper(EvtType,time,fs,signalparams);
%plot(time,Signal);

[EvtTimestamp,...
          EvtSynx,...
          EvtFreq,...
          EvtROCOF] = UserEvtRptWrapper(EvtType,...
                                       time,...
                                       signalparams,...
                                       T0,...
                                       F0);
plot(time,EvtSynx(:,1));
                                   