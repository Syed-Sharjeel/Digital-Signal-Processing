clc;
clear;
close all;

% Signal parameters
signalFrequency = 100;
samplingFrequency = 10000;

samplingTime = 1 / samplingFrequency;
timeVector = 0:samplingTime:1;

% Generate cosine signal
inputSignal = cos(2 * pi * signalFrequency * timeVector);

% Quantization for 1-bit through 8-bit
for bitDepth = 1:8

    % Number of quantization levels
    quantizationLevels = 2^bitDepth;

    % Quantization interval
    quantizationStep = 2 / (quantizationLevels - 1);

    % Quantize the input signal
    quantizedSignal = quantizationStep * ...
                      round(inputSignal / quantizationStep);

    % Create a separate figure for each bit depth
    figure;

    plot(timeVector, inputSignal, 'b', 'LineWidth', 1.5);
    hold on;

    stairs(timeVector, quantizedSignal, 'r', 'LineWidth', 1);

    grid on;
    xlim([0 0.02]);

    title(sprintf('%d-Bit Quantization', bitDepth));
    xlabel('Time (s)');
    ylabel('Amplitude');

    legend('Original Signal', 'Quantized Signal', ...
           'Location', 'best');
end