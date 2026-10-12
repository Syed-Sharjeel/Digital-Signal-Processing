% Clear workspace, command window, and close figures
clc;
clear;
close all;

% Initialize simulation parameters
sampleIndices = 0:9;
signalFrequency = 0.1;
signalOriginIndex = 1;

% Define phase shifts [phi1, phi2] for Task 1, Task 2, and Task 3
phaseConfigurations = [ ...
    0,     pi/2;   % Task 1: 90-degree phase shift on y(n)
    0,     pi;     % Task 2: 180-degree phase shift on y(n)
    pi,    pi      % Task 3: In-phase shift on both x(n) and y(n)
];

numTasks = size(phaseConfigurations, 1);

% Compute time index vectors
timeIndicesX = (0:length(sampleIndices) - 1) - signalOriginIndex + 1;
timeIndicesY = (0:length(sampleIndices) - 1) - signalOriginIndex + 1;
lagIndices = (timeIndicesX(1) - timeIndicesY(end)) : (timeIndicesX(end) - timeIndicesY(1));

% Initialize figure window for combined phase change comparison
figure('Name', 'Cross-Correlation Analysis Across Phase Configurations', 'NumberTitle', 'off');

% Process each phase configuration loop
for taskIndex = 1:numTasks
    
    % Extract phase values for current task
    phi1 = phaseConfigurations(taskIndex, 1);
    phi2 = phaseConfigurations(taskIndex, 2);
    
    % Generate discrete-time sinusoidal signals
    signalX = sin(2 * pi * signalFrequency * sampleIndices + phi1);
    signalY = sin(2 * pi * signalFrequency * sampleIndices + phi2);
    
    % Compute cross-correlation and peak location
    crossCorr = xcorr(signalX, signalY);
    [maxCorrValue, maxCorrIndex] = max(crossCorr);
    zeroLagValue = crossCorr(lagIndices == 0);
    
    % Display numerical output to Command Window
    fprintf('=== Task %d (phi1 = %.2f, phi2 = %.2f) ===\n', taskIndex, phi1, phi2);
    fprintf('Correlation at lag zero : %.4f\n', zeroLagValue);
    fprintf('Maximum correlation lag  : %d (Value: %.4f)\n\n', lagIndices(maxCorrIndex), maxCorrValue);
    
    % Plot signal x(n)
    subplot(3, numTasks, taskIndex);
    stem(timeIndicesX, signalX, 'filled', 'LineWidth', 1.2);
    title(sprintf('Task %d: x(n) [\\phi_1 = %.2f]', taskIndex, phi1));
    xlabel('Time Index n');
    ylabel('Amplitude');
    xlim([timeIndicesX(1) - 1, timeIndicesX(end) + 1]);
    grid on;
    
    % Plot signal y(n)
    subplot(3, numTasks, taskIndex + numTasks);
    stem(timeIndicesY, signalY, 'filled', 'LineWidth', 1.2);
    title(sprintf('Task %d: y(n) [\\phi_2 = %.2f]', taskIndex, phi2));
    xlabel('Time Index n');
    ylabel('Amplitude');
    xlim([timeIndicesY(1) - 1, timeIndicesY(end) + 1]);
    grid on;
    
    % Plot cross-correlation r_xy(n)
    subplot(3, numTasks, taskIndex + 2 * numTasks);
    stem(lagIndices, crossCorr, 'filled', 'LineWidth', 1.2);
    title(sprintf('Task %d: r_{xy}(l)', taskIndex));
    xlabel('Lag Index l');
    ylabel('Amplitude');
    xlim([lagIndices(1) - 1, lagIndices(end) + 1]);
    grid on;
    
end