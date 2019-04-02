%% Sinefit demo
% This demo
% - Generates two real sinusoids with noise.
%   yi = offi+Ai*cos(w*t+phi) 
%   yq = offq+Aq*sin(w*t+phq) 
% - adds noise to yi and yq
% - performs sinefit separately for both yi and yq
% - performs sinefit for complex sinusoid y = yi+1i*yq
% - echoes and plots the fit results
%% Choose your fit method
fit_method = 1;	% 0: use the 3-parameter fit (known frequency).
                % 1: use the 4-parameter fit.
                % 2: use the optimization-toolbox-enhanced 4-parameter fit.
%% Define custom periodic function
% The default fit function is cos(...), but it can be e.g. sin(...):
% Hq = @sin;
% Hq = @(x) sin(x);
Hq = @(x) cos(x-pi/2);	% Hq is a function handle for the sinefit of yq. 
                        % Here, yq will be defined by sin(x) = cos(x-pi/2).
%% Define fundamental, declare noise parameters
N=pow2(9);          	% vector length
fs = 1.0e6;             % sampling freq
ts = 1/fs;              % sampling interval
t = (0:(N-1)).'*ts;     % time vector
% Define two single tones with the same frequency
f = 6667;               % single-tone freq (Hz)
w=2*pi*f;               % angular frequency (rad/s)
Ai = 1.2;               % in-phase (I) amplitude
Aq = 0.8;               % quadrature-phase (Q) amplitude
phi = pi/3;             % phase I (rad)
phq = pi/4;             % phase Q (rad)
offi = 0.8;             % offset I
offq = 1.2;             % offset Q
% Noise and Harmonics
stdJit = ts*1.0e-1;     % standard deviation of jitter noise
stdNoi = 1.0e-3;        % standard deviation of noise added to signal
stdPha  = pi/36;       % standard deviation of phase noise
A2I = 5.0e-2;           % 2. harmonic proportional to Ai
A3I = 1.0e-2;           % 3. harmonic proportional to Ai
A2Q = 4.0e-2;           % 2. harmonic proportional to Aq
A3Q = 2.0e-2;         	% 3. harmonic proportional to Aq
% iterative search on w
TolX = 1e-4;            % Termination tolerance on w, a positive scalar.
MaxIter = 64;           % Maximum number of iterations allowed
%% Frequency w: Known, Initial or Range
switch fit_method       % sinefit input frequency is W, where...
    case 0
       W=w;             % W is the known frequency w
       msg='3-parameter sinefit';
    case 1
       W=w-w/8;         % W is the initial guess of the known frequency w.
       msg='4-parameter sinefit';
    case 2
       W=[w-w/4,w+w/4]; % w has to be found between W(1) and W(2)
       msg='4-parameter fminbnd sinefit';
    otherwise
        disp('No such fit_method')
        return
end
%% generate Noise
rng(693653) % seed number for repeatability
n_i     = randn(N,1);	n_i     = stdNoi*n_i/std(n_i);
n_q     = randn(N,1);   n_q     = stdNoi*n_q/std(n_q);
n_phi   = randn(N,1);   n_phi   = stdPha*n_phi/std(n_phi);
n_phq   = randn(N,1);   n_phq   = stdPha*n_phq/std(n_phq);
n_jiti  = randn(N,1);   n_jiti  = stdJit*n_jiti/std(n_jiti);
n_jitq  = randn(N,1);   n_jitq  = stdJit*n_jitq/std(n_jitq);
%% Generate noisy single-tones and a noisy complex sinusoid
% clock jitter
ti = t + n_jiti;
tq = t + n_jitq;
% sinusoid with phase noise and clock jitter
yi = Ai*cos(w*ti+phi+n_phi);  
yq = Aq*sin(w*tq+phq+n_phq);     % Hq is the sin(...) function
% add offset, noise & harmonics
yi = offi + yi + A2I*yi.*yi + A3I*yi.*yi.*yi + n_i; 
yq = offq + yq + A2Q*yq.*yq + A3Q*yq.*yq.*yq + n_q; 
y = yi+1i*yq;
%% Fit
switch fit_method
    case 0 % known frequency
        [paramsi,yi_est,yi_resid,err_rmsi] = sinefit(yi,t,W); % yi only (I)
        [paramsq,yq_est,yq_resid,err_rmsq] = sinefit(Hq,yq,t,W); % yq only (Q)
        [params,y_est,y_resid,err_rms] = sinefit(y,t,W); % Complex yi+j*yq
    otherwise
        [paramsi,yi_est,yi_resid,err_rmsi] = sinefit(yi,t,W,TolX,MaxIter);
        [paramsq,yq_est,yq_resid,err_rmsq] = sinefit(Hq,yq,t,W,TolX,MaxIter);
        [params,y_est,y_resid,err_rms] = sinefit(y,t,W,TolX,MaxIter);
end
%% echo
clc
offi_est = paramsi(1);  Ai_est = paramsi(2);
phi_est  = paramsi(3);  w_esti = paramsi(4);
offq_est = paramsq(1);  Aq_est = paramsq(2);
phq_est  = paramsq(3);  w_estq = paramsq(4);
off_est  = params(:,1);   A_est  = params(:,2);
ph_est   = params(:,3);   w_est  = params(1,4);
fprintf('Using %s.\n',msg)
if fit_method==0
    fprintf('True and estimated offset, Amplitude and phase (deg).\n')
    fprintf('(The frequency is known)\n\n')
else
    fprintf('True and estimated offset, Amplitude, phase (deg) and freq (Hz).\n\n')
end
fprintf('*************************************\n')
fprintf('FIT: offi+1i*offq+Ai*cos(w*t+phi)+1i*Aq*sin(w*t+phq)\n')
fprintf('In-phase [offi,Ai,phi,f]\n')
fprintf('True%6.4g\t%6.4g\t%6.4g\t%6.4g\nEst\t\t%0.4g\t%0.4g\t%0.4g\t%0.4g\n',offi,Ai,phi/pi*180,f,off_est(1),A_est(1),ph_est(1)/pi*180,w_est/(2*pi))
fprintf('Quadrature-phase [offq,Aq,phq,f]\n')
fprintf('True%6.4g\t%6.4g\t%6.4g\t%6.4g\nEst\t\t%0.4g\t%0.4g\t%0.4g\t%0.4g\n\n',offq,Aq,phq/pi*180,f,off_est(2),A_est(2),ph_est(2)/pi*180,w_est/(2*pi))
fprintf('*************************************\n')
fprintf('FIT: offi+Ai*cos(w*t+phi)\n')
fprintf('[offi,Ai,phi,fi]\n')
fprintf('True%6.4g\t%6.4g\t%6.4g\t%6.4g\nEst\t\t%0.4g\t%0.4g\t%0.4g\t%0.4g\n\n',offi,Ai,phi/pi*180,f,offi_est,Ai_est,phi_est/pi*180,w_esti/(2*pi))
fprintf('*************************************\n')
fprintf('FIT: offq+Aq*sin(w*t+phq)\n')
fprintf('REAL fit [offq,Aq,phq,fq]\n')
fprintf('True%6.4g\t%6.4g\t%6.4g\t%6.4g\nEst\t\t%0.4g\t%0.4g\t%0.4g\t%0.4g\n\n',offq,Aq,phq/pi*180,f,offq_est,Aq_est,phq_est/pi*180,w_estq/(2*pi))
%% plot
figure(1)
subplot(4,4,[1 2 5 6 9 10])
plot(t,yi,'.',t,yi_est)
xlabel('time (s)'), ylabel('amplitude'), title('yi')
legend('Data','Fit')
subplot(4,4,[3 4 7 8 11 12])
plot(t,yq,'.',t,yq_est)
xlabel('time (s)'), ylabel('amplitude'), title('yq')
legend('Data','Fit')
subplot(4,4,13:16)
plot(t,yi_resid,'.',t,yq_resid,'.')
xlabel('time (s)'), ylabel('error'), title('residuals')
legend('yi','yq')
set(get(gca,'Parent'),'name','Sinefit Real Data');
%%
figure(2)
subplot(221)
plot(yi,yq,'.',yi_est,yq_est,'.')
title('Two separate sinefits: yi and yq (y=yi+j?yq)')
xlabel('yi (In-phase)')
ylabel('yq (Quadrature-phase)')
legend('y','y_{fit}')
if fit_method>0
    YLIM = get(gca,'YLim');
    deltaf = abs(w_esti-w_estq)/(2*pi);
    text(0,mean(YLIM),['FIT: \Deltaf_{IQ}=',num2str(deltaf,3),'Hz'])
end
subplot(222)
plot(yi_resid,yq_resid,'.')
%hold on
%plot(y_resid,'.')
%hold off
%title('Complex residual') 
%legend('yi & yq fit','y1+j?yq fit')
xlabel('yi residual'),ylabel('yq residual')
%subplot(224)
yerr_sep = y-(yi_est+1i*yq_est);
err_rms_sep = norm(yerr_sep)/sqrt(length(yerr_sep));
title(['Complex residual (RMS error: ',int2str(round(20*log10(err_rms_sep))), 'dB)'])
subplot(212),
plot3(t,angle(y)/pi*180,abs(y),'.')
hold on
temp = angle(((yi_est+1i*yq_est)))/pi*180;
plot3(t,temp,abs((yi_est+1i*yq_est)),'.')
hold off
zlabel('|y|')
ylabel('arg(y) (deg)')
xlabel('time (s)')
legend('y','y_{fit}')
title('|y| and arg(y) vs. time')
grid on 
box on
% subplot(223)
% plot(t,abs(y),t,abs((yi_est+1i*yq_est)))
% title('|y|=|yi+j?yq| from separate I-Q sinefits')
% xlabel('t (s)')
% ylabel('|y|')
% legend('|y|','|y_f_i_t|')
% YLIMx = get(gca,'YLim');
% text(t(1),mean(YLIMx),['RMS error: ',int2str(round(20*log10(err_rms_sep))), 'dB'])
% 
% subplot(224)
% plot(t,angle(y)/pi*180,t,angle(yi_est+1i*yq_est)/pi*180)
% title('arg(y) from separate I-Q sinefits')
% xlabel('t (s)')
% ylabel('arg(y) (deg)')
% legend('arg(y)','arg(y)_f_i_t')
% YLIMx = get(gca,'YLim');
set(get(gca,'Parent'),'name','Complex Sinefit: yi and yq separately');
%%
figure(3)
subplot(221)
plot(y,'.')
hold on
plot(y_est,'.')
hold off
title('Complex yi+j?yq sinefit')
legend('y','y_{fit}')
xlabel('yi'),ylabel('yq')
if fit_method > 0
    text(0,mean(YLIM),'FIT: \Deltaf_{IQ}=0 Hz (guaranteed)')
end
subplot(222)
plot(y_resid,'.')
%title('Complex residual') 
title(['Complex residual (RMS error: ',int2str(round(20*log10(err_rms))), 'dB)'])
%legend('yi & yq fit','y1+j?yq fit')
xlabel('yi residual'),ylabel('yq residual')
%subplot(224)
subplot(212),
plot3(t,angle(y)/pi*180,abs(y),'.')
hold on
temp = angle(y_est)/pi*180;
plot3(t,temp,abs(y_est),'.')
hold off
zlabel('|y|')
ylabel('arg(y) (deg)')
xlabel('time (s)')
legend('y','y_{fit}')
title('|y| and arg(y) vs. time')
grid on 
box on
% subplot(224)
% plot(t,angle(y)/pi*180,t,angle(y_est)/pi*180)
% title('arg(y) from complex sinefit')
% xlabel('t (s)')
% ylabel('arg(y) (deg)')
% legend('arg(y)','arg(y)_f_i_t')
% 
% %text(t(1),mean(YLIMx),['RMS error: ',int2str(round(20*log10(err_rms_sep))), 'dB'])
% 
set(get(gca,'Parent'),'name','Truly Complex Sinefit');
