clc; 
clear all; 
close all; 
rp=input('Enter the passband ripple(rp):'); 
rs=input('Enter the stopband ripple(rs):'); 
fp=input('Enter the passband frequency(fp):'); 
fs=input('Enter the stopband frequency(fs):'); 
f=input('Enter the sampling frequency(f):'); 
wp=2*fp/f; 
ws=2*fs/f; 
num=-20*log10(sqrt(rp*rs))-13; 
dem=14.6*(fs-fp)/f; 
n=ceil(num/dem); 
n1=n+1; 
if(rem(n,2)~=0) 
    n1=n; 
    n=n-1; 
end 
y=boxcar(n1); 
%Low pass filter 
b=fir1(n,wp,y); 
[h,o]=freqz(b,1,256); 
m=20*log10(abs(h)); 
subplot(2,2,1); 
plot(m); 
ylabel('Gain(db)->'); 
xlabel('(a)Normalised frequency->'); 
%High pass filter 
b=fir1(n,wp,'high',y); 
[h,o]=freqz(b,1,256); 
m=20*log10(abs(h)); 
 
subplot(2,2,2); 
plot(m); 
ylabel('Gain(db)'); 
xlabel('(b)Normalised frequency'); 
%Band pass filter 
wn=[wp*ws]; 
b=fir1(n,wn,y); 
[h,o]=freqz(b,1,256); 
m=20*log10(abs(h)); 
subplot(2,2,3); 
plot(m); 
ylabel('Gain(db)'); 
xlabel('(c)Normalised frequency'); 
%Band stop filter============== 
wn=[wp*ws]; 
b=fir1(n,wn,'stop',y); 
[h,o]=freqz(b,1,256); 
m=20*log10(abs(h)); 
subplot(2,2,4); 
plot(m); 
ylabel('Gain(db)'); 
xlabel('(d)Normalised frequency-'); 