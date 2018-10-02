function [A,C,X] = CalcStateMatrix (Fs,Type,Freq,Index,Phase,Damping,Handle)

w = Freq * 2 * pi;
Rad = Phase*pi/180;

%Initial state of the X matrix
dim = 2*length(Freq);
X = zeros(dim,1);

for n = 1:length(Freq)
    
    % SubMatrix = [cos(Rad(n,1)),-sin(Rad(n,1))/w(2)];
    SubMatrix = [1,0];
    X(2*n-1:2*n,1)=SubMatrix;
end  
 
% Calculate the A matrix, this is the same for all signal types

A = zeros(dim,dim);
for n = 1:length(Freq)
    SubMatrix = [0,1;-(w(n)^2),Damping(n)];
    A(2*n-1:2*n,2*n-1:2*n) = SubMatrix;
end
A = expm(-A/Fs);


%Setting up to calculate the C matrix
NumFreqs = length(Freq);    % number of bands
i = (ceil(NumFreqs/2));     % the center band should be the fundamental frequency   
C = zeros(dim,dim);

%The C matrix depends on the Signal Type
switch Type
    case 'Amplitude Modulation'
        % error checking, there should be 3 frequencies and the center
        % frequency should be between the first and third.
        if NumFreqs ~= 3
	    msg = sprintf('%s signal type should have 3 frequencies, this has %d',[Type NumFreqs]);	
            error (msg);
        end
        if Freq(1) >= Freq(2) || Freq(2) >= Freq(3) 
            error ('Fundamental frequency should be the center frequency of the three')
        end
        C(1,:) = [ (Index(1)/2)*cos(-Rad(1,1)+Rad(2,1)) -(Index(1)/2)*(sin(-Rad(1,1)+Rad(2,1))/w(1)) ...
                    Index(2)*cos(-Rad(2,1)) Index(2)*sin(-Rad(2,1))/w(2) ...
                   (Index(3)/2)*cos(-Rad(3,1)-Rad(2,1)) (Index(3)/2)*sin(-Rad(3,1)-Rad(2,1))/w(3)]; 
    
    case 'Phase Modulation'
        % NOTE YOU CAN PHASE SHIFT THE MODULATION, BUT NOT THE FUNDAMENTAL
        if rem(NumFreqs,2)==0 %even
	    msg = sprintf('%s signal type must have an odd number of frequencies, this has %d',[Type NumFreqs]);	
            error (msg);
        end
        if NumFreqs < 5
		msg = sprintf('%s signal type must at have least 5 frequencies, this has %d',Type,NumFreqs);
		error (msg)
        end
        for n=1:length(Freq)-1
            if Freq(n) >= Freq(n+1) 
                error ('Frequencies must be in ascending order with the fundamental frequency at the center')
            end 
        end
        
        %{
        %bessel functions:
        
        for n = 1:i
            J(n) = besselj(n-1,Index(1));
        end 
        %}

        J = getBessel(NumFreqs,Index);  
        
        % C Matrix
        SubMatrix = zeros(1,NumFreqs*2);
        for n = 1:NumFreqs
            a = abs(i-n)+1;
            b = (2*(n-1))+1;
            c = a-1;
            if c == 0
                c = 1;
            end

            if n-i < 0
                SubMatrix(1,b:b+1) = [(-1)^n*J(a)*cos(c*Rad(n)) -(-1)^n*J(a)*sin(c*Rad(n))/w(n)];
            else
                SubMatrix(1,b:b+1) = [J(a)*cos(c*Rad(n)) J(a)*sin(c*Rad(n))/w(n)];
            end
        end
        
        C(1,:) = SubMatrix;
            
    case 'Combined Modulation'
        %NOTE, for now neither the modultion nor the fundamental can be
        %phase shifted.
        if rem(NumFreqs,2)==0 %even
	    msg = sprintf('%s signal type must have an odd number of frequencies, this has %d',[Type NumFreqs]);
            error (msg);
        end
        if NumFreqs < 5
            msg = sprintf('%s signal type must at have least 5 frequencies, this has %d',[Type NumFreqs]);
	    error (msg);
        end
        for n=1:length(Freq)-1
            if Freq(n) >= Freq(n+1) 
                error ('Frequencies must be in ascending order with the fundamental frequency at the center')
            end 
        end

        J = getBessel(NumFreqs+2,Index);  % need one more bessel value than there are frequencies
        SubMatrix = zeros(1,NumFreqs*2);
        for n = 1:NumFreqs   
            a = abs(i-n)+1;
            b = (2*(n-1))+1;
            if n-i < 0
                SubMatrix(1,b) =  J(a+1)*Index(n)/2 ...
                                     +(-1)^n*J(a) ...
                                     + J(a-1)*Index(n)/2;
                    
            elseif n-i == 0
                SubMatrix(1,b) =  J(a)*Index(n);
                    
            else
                SubMatrix(1,b) =  J(a+1)*Index(n)/2 ...
                                      + J(a) ...
                                      + J(a-1)*Index(n)/2;    
            end
            SubMatrix(1,b+1) = 0;
        end
        C(1,:) = SubMatrix;

               
    otherwise
             msg = sprintf('Unhandled signal type: %s',Type)
	     error (msg);
end

   

end

function J = getBessel(NumFreqs,Index)
        i = (ceil(NumFreqs/2));
        for n = 1:i
            J(n) = besselj(n-1,Index(1));
        end 
end
