clc;
clear;
close all;

% Fixed sampling frequency
fs = 8000;
Ts = 1/fs;

% User input for signal frequency
f = input('Enter the signal frequency f (Hz): ');

% Time vector
t = 0:Ts:1;

% Generate sinusoidal signal
x = sin(2*pi*f*t);

% Display frequency
fprintf('Playing tone for %d Hz\n', f);

% Play the signal
sound(x, fs);

% Wait for playback to finish
pause(2);