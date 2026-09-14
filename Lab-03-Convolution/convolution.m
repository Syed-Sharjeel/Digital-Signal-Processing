clear all;  
close all; 
clc;  

h = [3 2 1 -2 1 0 -4 0 3]; % impulse response  
org_h = 2; % Sample number where origin exists  
nh = [0 : length(h)-1]- org_h + 1;

x = [1 -2 3 -4 3 2 1]; % input sequence 
org_x = 1; % Sample number where origin exists  
nx = [0 : length(x)-1]- org_x + 1; 

y = conv(h,x);   
ny = [nh(1)+ nx(1) : nh(end)+nx(end)]; 

figure, 
 
subplot(3,1,1), 
stem(nh,h); 
xlabel('Time index n'); 
ylabel('Amplitude'); 
xlim([nh(1)-1 nh(end)+1]); 
title('Impulse Response h(n)'); 
grid;  
subplot(3,1,2), 
stem(nx,x); 
xlabel('Time index n');  
ylabel('Amplitude'); 
xlim([nx(1)-1 nx(end)+1]); 
title('Input Signal x(n)'); 
grid;  
subplot(3,1,3)  
stem(ny,y);  
xlabel('Time index n');  
ylabel('Amplitude');  
xlim([ny(1)-1 ny(end)+1]);  
title('Output Obtained by Convolution'); 
grid;  