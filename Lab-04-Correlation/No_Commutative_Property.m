% Clear workspace, command window, and close figures
clc;
clear;
close all;

% Initialize signal parameters and phase shifts
phase1 = 0;
phase2 = 10;
sampleIndices = 0:1:9;
signalOriginIndex = 1;

% Define time index vectors
timeIndicesX = sampleIndices - signalOriginIndex + 1;
timeIndicesY = sampleIndices - signalOriginIndex + 1;

% Generate input signals
signalX = sin(1 * pi * sampleIndices + phase1);
signalY = sin(5 * pi * sampleIndices + phase2);

% Compute forward and reverse cross-correlations
crossCorrXY = xcorr(signalX, signalY);
crossCorrYX = xcorr(signalY, signalX);
lagIndices = (timeIndicesX(1) - timeIndicesY(end)) : (timeIndicesX(end) - timeIndicesY(1));

% Plot input signals and cross-correlations
figure('Name', 'Non-Commutative Property of Cross-Correlation', 'NumberTitle', 'off');

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

% Plot r_xy(n)
subplot(2, 2, 3);
stem(lagIndices, crossCorrXY, 'filled', 'LineWidth', 1.2);
title('Output Signal: r_{xy}(n)');
xlabel('n');
ylabel('r_{xy}(n)');
xlim([lagIndices(1) - 1, lagIndices(end) + 1]);
grid on;

% Plot r_yx(n)
subplot(2, 2, 4);
stem(lagIndices, crossCorrYX, 'filled', 'LineWidth', 1.2);
title('Output Signal: r_{yx}(n)');
xlabel('n');
ylabel('r_{yx}(n)');
xlim([lagIndices(1) - 1, lagIndices(end) + 1]);
grid on;