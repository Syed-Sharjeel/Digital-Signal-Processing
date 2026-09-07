clc; close all; clear;

f = 1/50;
n = [0 : 499];

q = input('Enter Number of Digits: ');
x = cos(2*pi*f*n);
xq = round(x*10^q)/10^q;
xe = xq - x;
px = sum((abs(x).^2))/length(x);
pe = sum((abs(xe).^2))/length(x);

SQNR = 10 * (log10(px/pe));

fprintf('THE SQNR is %d db', SQNR);
figure, 
subplot(2,1,1); 
plot(n,x,n,xq); 
xlabel('indices'); 
ylabel('Amp'); 
xlim([0 49]); 
ylim([-1.1 1.1]); 
legend('DTCV','DTDV'); 
 
subplot(2,1,2); 
plot(n,xe); 
xlabel('indices'); 
ylabel('Error'); 
xlim([0 49]); 