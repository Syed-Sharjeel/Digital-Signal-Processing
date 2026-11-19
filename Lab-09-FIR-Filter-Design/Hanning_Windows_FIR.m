 
close all; 
clear all; 
clc; 
  
fp=input('Enter the pass band frequency'); 
fs=input('Enter the stop band frequency'); 
rp=input(' Enter the pass band attenuation'); 
rs=input('Enter the stop band attenuation'); 
f=input(' Enter the sampling frequency'); 
  
% Calculating filter order 
  
num=-20*log10(sqrt(rp*rs))-13; 
dem=14.6*(fs-fp)/f; 
n=ceil(num/dem); 
n=abs(n); 
  
% Normalizing the frequencies 
  
wp=2*fp/f; 
ws=2*fs/f; 
wn=(ws+wp)/2; 
 
%Adjusting the filter order. The order of window must be an odd number  
%and the order of filter must be one less than that of the window  
  
if (rem(n,2)==0) 
    m=n+1; 
else 
        m=n; 
        n=n-1; 
end 
  
%Window sequence calculation 
  
w=hann(m); 
  
%Calculation of filter coefficients 
  
b=fir1(n,wn,'low',w); 
  
%Plotting the filter response 
  
freqz(b,1,500,3000); 
title('Magnitude and Phase response'); 