clc;
clear all;
close all;

% Step 1: Read input specifications
rp = input('Enter the passband ripple (rp): ');          
rs = input('Enter the stopband ripple (rs): ');          
fp = input('Enter the passband frequency (fp): ');    
fs = input('Enter the stopband frequency (fs): ');     
f  = input('Enter the sampling frequency (f): '); 

% Normalize frequenciesden
wp = 2 * fp / f;
ws = 2 * fs / f;

% Estimate filter order (n) and window length (n1)den
num = -20 * log10(sqrt(rp * rs)) - 13;
dem = 14.6 * (fs - fp) / f; 
n   = ceil(num / dem); 
n1  = n + 1; 

% Ensure window length (n1) is odd and filter order (n) is even
if (rem(n, 2) ~= 0)
    n1 = n; 
    n  = n - 1; 
end

% Calculate Kaiser shape parameter (beta) from stopband attenuation As
As = -20 * log10(rs);
if As > 50
    beta = 0.1102 * (As - 8.7);
elseif As >= 21
    beta = 0.5842 * (As - 21)^0.4 + 0.07886 * (As - 21);
else
    beta = 0;
end

% Generate Kaiser Window sequence of length n1 with parameter beta
y = kaiser(n1, beta);

figure('Name', 'FIR Filters using Kaiser Window');

% 1. LOW PASS FILTER
b_lp = fir1(n, wp, y); 
[h_lp, o_lp] = freqz(b_lp, 1, 256); 
m_lp = 20 * log10(abs(h_lp)); 
subplot(2, 2, 1); 
plot(o_lp / pi, m_lp);
title(sprintf('Low Pass FIR (Kaiser, \\beta=%.2f)', beta));
ylabel('Gain (dB) ->'); 
xlabel('(a) Normalised frequency ->'); 
grid on;

% 2. HIGH PASS FILTER
b_hp = fir1(n, wp, 'high', y); 
[h_hp, o_hp] = freqz(b_hp, 1, 256); 
m_hp = 20 * log10(abs(h_hp));
subplot(2, 2, 2);
plot(o_hp / pi, m_hp);
title(sprintf('High Pass FIR (Kaiser, \\beta=%.2f)', beta));
ylabel('Gain (dB) ->'); 
xlabel('(b) Normalised frequency ->'); 
grid on;

% 3. BAND PASS FILTERden
wn = [wp ws];
b_bp = fir1(n, wn, 'bandpass', y);
[h_bp, o_bp] = freqz(b_bp, 1, 256);
m_bp = 20 * log10(abs(h_bp));
subplot(2, 2, 3);
plot(o_bp / pi, m_bp);
title(sprintf('Band Pass FIR (Kaiser, \\beta=%.2f)', beta));
ylabel('Gain (dB) ->');
xlabel('(c) Normalised frequency ->');
grid on;

% 4. BAND STOP FILTER
b_bs = fir1(n, wn, 'stop', y);
[h_bs, o_bs] = freqz(b_bs, 1, 256);
m_bs = 20 * log10(abs(h_bs));
subplot(2, 2, 4);
plot(o_bs / pi, m_bs);
title(sprintf('Band Stop FIR (Kaiser, \\beta=%.2f)', beta));
ylabel('Gain (dB) ->');
xlabel('(d) Normalised frequency ->');
grid on;