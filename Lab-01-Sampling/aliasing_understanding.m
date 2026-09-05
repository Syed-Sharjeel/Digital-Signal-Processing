clear all; close all; clc; 
F1 = 10;  
F2 = 110; 
Fs = 100; 
Ts = 1/Fs;  
t = [0 : 0.0005 : 0.2];

x1t = cos(2*pi*F1*t);  
x2t = cos(2*pi*F2*t);  

figure,  
plot(t,x1t,t,x2t, 'LineWidth',2);  
xlabel('cont time (sec)'); 
ylabel('Amp'); 
xlim([0 0.1]); 
grid on; 
legend('10Hz','110Hz');  
title('Two CTCV sinusoids plotted');  

nTs = [0 :Ts : 0.2];  
n = [1 : length(nTs)-1 ]; 
x1n = cos(2*pi*F1*nTs);  
x2n = cos(2*pi*F2*nTs); 

figure,  
subplot(2,1,1),  
stem(nTs,x1n,'LineWidth',2); 
grid on; 
xlabel('discrete time (sec)'); 
ylabel('Amp'); 
xlim([0 0.1]); 
subplot(2,1,2) 
stem(nTs,x2n,'LineWidth',2); 
grid on; 
title('110Hz sampled')  
xlabel('discrete time(sec)'); 
ylabel('Amp'); 
xlim([0 0.1]); 

figure, 
plot(t,x1t,t,x2t); 
hold;  
stem(nTs,x1n,'r','LineWidth',2); 
xlabel('time (sec)');  
ylabel('Amp'); 
xlim([0 0.1]); 
legend('10Hz','110Hz'); 