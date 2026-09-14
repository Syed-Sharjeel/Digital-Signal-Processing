%% Convolution of Speech Signal with an Impulse Response

clearvars;
close all;
clc;

% Read the impulse response and speech audio files.
[h, fsH] = audioread('Audio-Files/IR_HALL.wav');
[x, fsX] = audioread('Audio-Files/speech.wav');

% Convert stereo signals to mono by averaging the audio channels.
x = mean(x, 2);
h = mean(h, 2);

% Resample the impulse response to match the speech signal sampling rate.
h = resample(h, fsH, fsX);

% Convolve the speech signal with the impulse response.
y = conv(x, h);

% Normalize the output signal to prevent clipping.
y = y / max(abs(y));

% Play the convolved audio signal.
sound(y, fsH);
audiowrite('Output-Files/Convolved_Output.wav', y, fsH);
% Generate the time axis for the output signal.
time = (0:length(y) - 1) / fsH;

% Plot the convolved output signal.
figure;

plot(time, y);
title('Convolved Output y(n)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;