% Clear workspace, command window, and close figures
clc;
clear;
close all;

% Initialize audio sampling settings
samplingFrequency = 2000;
timeVector = 0 : (1 / samplingFrequency) : 10;
signalOriginIndex = 1;

% Generate composite audio signal x(t) and reference tone y(t)
signalX = sin(2 * pi * 1 * timeVector) + sin(2 * pi * 2 * timeVector) + sin(2 * pi * 3 * timeVector);
signalY = sin(2 * pi * 1 * timeVector);

% Compute discrete time index vectors
timeIndicesX = (0:length(signalX) - 1) - signalOriginIndex + 1;
timeIndicesY = (0:length(signalY) - 1) - signalOriginIndex + 1;

% Compute cross-correlation and lag vector
crossCorr = xcorr(signalX, signalY);
lagIndices = (timeIndicesX(1) - timeIndicesY(end)) : (timeIndicesX(end) - timeIndicesY(1));

% Plot audio signals and output correlation
figure('Name', 'Audio/Continuous Signal Cross-Correlation', 'NumberTitle', 'off');

% Plot composite signal x(t)
subplot(3, 1, 1);
plot(timeVector, signalX, 'LineWidth', 1.0);
title('Composite Signal x(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot target component tone y(t)
subplot(3, 1, 2);
plot(timeVector, signalY, 'LineWidth', 1.0);
title('Reference Tone y(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot cross-correlation
subplot(3, 1, 3);
plot(lagIndices, crossCorr, 'LineWidth', 1.0);
title('Cross-Correlation r_{xy}(l)');
xlabel('Lag Index l');
ylabel('Amplitude');
xlim([lagIndices(1) - 1, lagIndices(end) + 1]);
grid on;