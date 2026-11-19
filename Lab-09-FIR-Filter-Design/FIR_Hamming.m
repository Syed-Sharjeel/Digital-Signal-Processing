clc;
clear all;
close all;

% Step 1: Read the input specifications[cite: 1]
rp = input('Enter the passband ripple (rp): ');          
rs = input('Enter the stopband ripple (rs): ');          
fp = input('Enter the passband frequency (fp): ');       
fs = input('Enter the stopband frequency (fs): ');       
f  = input('Enter the sampling frequency (f): ');        

% Normalize frequencies (0 to 1, where 1 corresponds to f/2)[cite: 1]
wp = 2 * fp / f; %[cite: 1]
ws = 2 * fs / f; %[cite: 1]

% Estimate filter order (n) and window length (n1)[cite: 1]
num = -20 * log10(sqrt(rp * rs)) - 13; %[cite: 1]
dem = 14.6 * (fs - fp) / f; %[cite: 1]
n   = ceil(num / dem); %[cite: 1]
n1  = n + 1; %[cite: 1]

% Ensure window length (n1) is odd and filter order (n) is even[cite: 1]
if (rem(n, 2) ~= 0)
    n1 = n; %[cite: 1]
    n  = n - 1; %[cite: 1]
end

% Generate Rectangular Window sequence of length n1[cite: 1]
y = boxcar(n1); %[cite: 1]

% ---------------------------------------------------------
% 1. LOW PASS FILTER[cite: 1]
% ---------------------------------------------------------
b_lp = fir1(n, wp, y); %[cite: 1]
[h_lp, o_lp] = freqz(b_lp, 1, 256); %[cite: 1]
m_lp = 20 * log10(abs(h_lp)); %[cite: 1]

subplot(2, 2, 1); %[cite: 1]
plot(o_lp / pi, m_lp);
title('Low Pass FIR Filter');
ylabel('Gain (dB) ->'); %[cite: 1]
xlabel('(a) Normalised frequency ->'); %[cite: 1]
grid on;

% ---------------------------------------------------------
% 2. HIGH PASS FILTER[cite: 1]
% ---------------------------------------------------------
b_hp = fir1(n, wp, 'high', y); %[cite: 1]
[h_hp, o_hp] = freqz(b_hp, 1, 256); %[cite: 1]
m_hp = 20 * log10(abs(h_hp)); %[cite: 1]

subplot(2, 2, 2); %[cite: 1]
plot(o_hp / pi, m_hp);
title('High Pass FIR Filter');
ylabel('Gain (dB) ->'); %[cite: 1]
xlabel('(b) Normalised frequency ->'); %[cite: 1]
grid on;

% ---------------------------------------------------------
% 3. BAND PASS FILTER[cite: 1]
% ---------------------------------------------------------
wn = [wp ws];
b_bp = fir1(n, wn, 'bandpass', y);
[h_bp, o_bp] = freqz(b_bp, 1, 256);
m_bp = 20 * log10(abs(h_bp));

subplot(2, 2, 3);
plot(o_bp / pi, m_bp);
title('Band Pass FIR Filter');
ylabel('Gain (dB) ->');
xlabel('(c) Normalised frequency ->');
grid on;

% ---------------------------------------------------------
% 4. BAND STOP FILTER
% ---------------------------------------------------------
b_bs = fir1(n, wn, 'stop', y);
[h_bs, o_bs] = freqz(b_bs, 1, 256);
m_bs = 20 * log10(abs(h_bs));

subplot(2, 2, 4);
plot(o_bs / pi, m_bs);
title('Band Stop FIR Filter');
ylabel('Gain (dB) ->');
xlabel('(d) Normalised frequency ->');
grid on;