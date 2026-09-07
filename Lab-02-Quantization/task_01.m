clc;
clear;
close all;

% Sampling configuration
frequencyA = 125;
frequencyB = 150;
samplingRate = 500;

sampleNumber = 0:249;
samplingInterval = 1 / samplingRate;
timeSamples = sampleNumber * samplingInterval;

% Generate the two cosine signals
signalA = cos(2 * pi * frequencyA * timeSamples);
signalB = cos(2 * pi * frequencyB * timeSamples);

% Quantization precision
digitCount = input('Enter Significant Digits: ');
scaleFactor = 10^digitCount;

% Quantization of Signal A
quantizedA = round(signalA * scaleFactor) / scaleFactor;
errorA = quantizedA - signalA;

signalPowerA = mean(abs(signalA).^2);
errorPowerA = mean(abs(errorA).^2);
sqnrA = 10 * log10(signalPowerA / errorPowerA);

% Quantization of Signal B
quantizedB = round(signalB * scaleFactor) / scaleFactor;
errorB = quantizedB - signalB;

signalPowerB = mean(abs(signalB).^2);
errorPowerB = mean(abs(errorB).^2);
sqnrB = 10 * log10(signalPowerB / errorPowerB);

% Display SQNR results
fprintf('SQNR for Signal 1: %.4f dB\n', sqnrA);
fprintf('SQNR for Signal 2: %.4f dB\n', sqnrB);