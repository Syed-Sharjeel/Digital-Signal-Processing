% Initialization and Workspace Cleanup
clc;
clear;
close all;

% Define Input Signal and Parameters
inputSignal = [1, 2, 3, 0];
numSamples = length(inputSignal);
timeIndex = 0:(numSamples - 1);
freqIndex = 0:(numSamples - 1);

% Compute Discrete Fourier Transform (DFT)
twiddleFactor = exp(-1j * 2 * pi / numSamples);
dftMatrix = twiddleFactor .^ (timeIndex' * freqIndex);
dftResult = inputSignal * dftMatrix;

% Compute Inverse Discrete Fourier Transform (IDFT)
idftMatrix = exp(1j * 2 * pi / numSamples * (timeIndex' * freqIndex));
idftResult = (dftResult * idftMatrix) / numSamples;

% Plot Time-Domain Signal and Frequency Spectrum
figure;

% Plot Original Time-Domain Signal
subplot(2, 1, 1);
stem(timeIndex, inputSignal, 'filled');
title('Given Signal x(n)');
xlim([timeIndex(1) - 0.5, timeIndex(end) + 0.5]);
ylabel('Amplitude');
xlabel('Samples (n)');
grid on;

% Plot Real Part of the DFT Result
subplot(2, 1, 2);
stem(timeIndex, real(dftResult), 'filled');
title('Discrete Fourier Transform X(k) (Real Part)');
xlim([timeIndex(1) - 0.5, timeIndex(end) + 0.5]);
ylabel('Amplitude');
xlabel('Frequency Index (k)');
grid on;