% Clear workspace, command window, and close figures
clc;
clear;
close all;

% Initialize signal parameters and phase shifts
phase1 = 0;
phase2 = 240;
sampleIndices = 0:1:9;
signalOriginIndex = 1;

% Define time index vectors
timeIndicesX = sampleIndices - signalOriginIndex + 1;
timeIndicesY = sampleIndices - signalOriginIndex + 1;

% Generate input signals
signalX = sin(1 * pi * sampleIndices + phase1);
signalY = sin(3 * pi * sampleIndices + phase2);

% Compute cross-correlation using convolution vs xcorr
crossCorrViaConv = conv(signalX, fliplr(signalY));
crossCorrDirect = xcorr(signalX, signalY);
lagIndices = (timeIndicesX(1) - timeIndicesY(end)) : (timeIndicesX(end) - timeIndicesY(1));

% Plot signal comparison and verification
figure('Name', 'Cross-Correlation via Convolution Equivalence', 'NumberTitle', 'off');

% Plot x(n)
subplot(2, 2, 1);
stem(timeIndicesX, signalX, 'filled', 'LineWidth', 1.2);
title('Input Signal: x(n)');
xlabel('n');
ylabel('x(n)');
xlim([timeIndicesX(1) - 1, timeIndicesX(end) + 1]);
grid on;

% Plot y(n)
subplot(2, 2, 2);
stem(timeIndicesY, signalY, 'filled', 'LineWidth', 1.2);
title('Input Signal: y(n)');
xlabel('n');
ylabel('y(n)');
xlim([timeIndicesY(1) - 1, timeIndicesY(end) + 1]);
grid on;

% Plot correlation computed via convolution
subplot(2, 2, 3);
stem(lagIndices, crossCorrViaConv, 'filled', 'LineWidth', 1.2);
title('r_{xy}(n) via Convolution');
xlabel('n');
ylabel('r_{xy}(n)');
xlim([lagIndices(1) - 1, lagIndices(end) + 1]);
grid on;

% Plot correlation computed directly
subplot(2, 2, 4);
stem(lagIndices, crossCorrDirect, 'filled', 'LineWidth', 1.2);
title('r_{xy}(n) via Correlation Function');
xlabel('n');
ylabel('r_{xy}(n)');
xlim([lagIndices(1) - 1, lagIndices(end) + 1]);
grid on;