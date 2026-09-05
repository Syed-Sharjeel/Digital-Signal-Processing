close all;
clear;
clc;

% User input
f = input('Enter the signal frequency f (Hz): ');
Fs = input('Enter the sampling frequency Fs (Hz): ');

% Sampling parameters
Ts = 1/Fs;

% Continuous-time signal
t = 0:0.0001:2;
x_t = sin(2*pi*f*t);

% Discrete-time samples
n = 0:round(2*Fs);
x_s = sin(2*pi*f/Fs*n);

% Nyquist criterion check
if Fs >= 2*f
    disp('Sampling condition satisfied: Fs >= 2f (No aliasing).');
else
    disp('Warning: Fs < 2f (Aliasing may occur).');
end

% Plot continuous-time signal
figure;
plot(t, x_t, 'b');
xlabel('Time (sec)');
ylabel('x(t)');
title('Continuous-Time Signal');
grid on;

% Plot sampled signal
figure;
stem(n*Ts, x_s, 'r', 'filled');
xlabel('Time (sec)');
ylabel('x_s(t)');
title('Sampled Signal');
grid on;