function [ posSeq ] = calcPosSeq (phases3)
%UNTITLED Takes any 3-phase input and calculateds the positive sequence
%   The input must be in the form: rows = data, columns = data
%   (3Phase(3,:))
posSeq=[];

if(~isempty(phases3))
    Rad120 = (2*pi)/3;
    A = exp(1i*Rad120);
    posSeq = (phases3(:,1)+(A*phases3(:,2))+(A^2*phases3(:,3)))/3;
    posSeq = posSeq.';
end
end

