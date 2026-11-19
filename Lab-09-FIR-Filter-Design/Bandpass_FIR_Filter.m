close all; clear all; clc; % Frequencies in Hz.  
 
 
F1 = 100;  F2 = 150;  
% Sampling Frequency in samples/sec.  
Fs = 1000;  
t = [0 : 1/Fs : 1]; % Time Vector 
F = Fs*[0:length(t)-1]/length(t); % Frequency Vector  
x = exp(j*2*pi*F1*t)+2*exp(j*2*pi*F2*t); % Signal Vector  
bh = fir1( 64 , [125  175]/500); % filter coeffs.  
bl = fir1( 64 , [75  125]/500); % filter coeffs. 
[hh,wh]=freqz(bh,1,length(t),'whole'); % Frequency response for filter 1 
[hl,wl]=freqz(bl,1,length(t),'whole'); % Frequency response for filter 2  
% Filter operation - see filtfilt in help to learn what it does  
yh = filtfilt(bh,1,x); 
yl = filtfilt(bl,1,x);  
% Plotting  
figure, subplot(5,1,1), 
plot(F,abs(fft(x))); 
xlim([0 Fs/2]);  
title('FFT of original signal');  
subplot(5,1,2), 
plot(F,abs(hh)); 
xlim([0 Fs/2]);  
title('Frequency response of Filter One');  
     subplot(5,1,3), 
     plot(F,abs(fft(yh))); 
     xlim([0 Fs/2]); 
     title('FFT of filtered signal from filter one'); 
subplot(5,1,4), 
plot(F,abs(hl)); 
xlim([0 Fs/2]);  
title('Frequency response of Filter Two');  
subplot(5,1,5), 
plot(F,abs(fft(yl))); 
xlim([0 Fs/2]); 
title('FFT of filtered signal from filter two'); 
xlabel('Hz.')  
 
% Pole Zero Constellations  
[bh,ah] = eqtflength(bh,1);  
[zh,ph,kh] = tf2zp(bh,ah); 
[bl,al] = eqtflength(bl,1);  
[zl,pl,kl] = tf2zp(bl,al); 
figure,  
subplot(1,2,1), 
pzmap(bh,ah); 
xlim([-1.5 1.5]); 
ylim([-1.5 1.5]); 
title('Filter_One'); 
subplot(1,2,2), 
pzmap(bl,al); 
xlim([-1.5 1.5]); 
ylim([-1.5 1.5]); 
title('Filter Two'); 