clear all; 
close all; 
clc; 
fd1 = 1/50; 
n = [0 : 499 ]; 
q = [0 : 10];  
% No. of Digits after decimal points to be retained for num = 1 : length(q)
for num = 1:length(q)
    x1 = cos(2*pi*fd1*n); 
    Px1 = sum(abs(x1).^2)/length(x1); 
    x1q = round(x1*10^q(num))/10^q(num); 
    x1e = x1 -x1q;
    Pe1 = sum(abs(x1e).^2)/length(x1e); 
    SQNR(num) = 10*log10(Px1/Pe1); 
end 
figure, 
plot(q,SQNR); 
xlabel('Significant Digits'); 
ylabel('SQNR (dB)'); 
xlim([q(1) q(end)]);
grid on;