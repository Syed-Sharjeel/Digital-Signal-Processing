
% Clear the command window, workspace, and existing figures.
clc;
clear;
close all;

% Read the audio signal and obtain its sampling frequency.
[audioSignal, samplingFrequency] = audioread('Audio-Files\speech.wav'); 

% Calculate the sampling period and generate the time vector.
samplingPeriod = 1 / samplingFrequency;
numberOfSamples = length(audioSignal);
sampleIndices = 0:(numberOfSamples - 1);
timeVector = sampleIndices * samplingPeriod;

% Calculate the frequency resolution and generate the frequency vector.
frequencyResolution = samplingFrequency / numberOfSamples;
frequencyVector = sampleIndices * frequencyResolution;

% Compute the Fast Fourier Transform of the audio signal.
frequencySpectrum = fft(audioSignal);

% Plot the magnitude spectrum in the frequency domain.
figure;
plot(frequencyVector, abs(frequencySpectrum));
grid on;
xlim([0, samplingFrequency / 2]);
xlabel('Frequency (Hz)');
ylabel('DFT Magnitude');
title('Discrete Fourier Transform');