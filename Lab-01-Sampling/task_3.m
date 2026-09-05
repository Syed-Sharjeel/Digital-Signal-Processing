% MATLAB Script for Interactive Audio Resampling & Aliasing Analysis

clear; clc; close all;

%% 1. File Selection
[fileName, filePath] = uigetfile({'*.wav;*.mp3;*.m4a;*.flac', 'Audio Files (*.wav, *.mp3, *.m4a, *.flac)'}, ...
    'Select Your Recorded Audio File');

if isequal(fileName, 0)
    disp('No file selected. Program terminated.');
    return;
end

fullPath = fullfile(filePath, fileName);
[y_orig, Fs_orig] = audioread(fullPath);

% Convert stereo to mono if necessary
if size(y_orig, 2) > 1
    y_orig = mean(y_orig, 2);
end

fprintf('Loaded file: %s\n', fileName);
fprintf('Original Sample Rate (Fs): %d Hz\n\n', Fs_orig);

%% 2. User Input for Target Sample Rate
validRates = [44100, 22050, 11025, 8192, 4096, 2048, 1024];

disp('Select or enter one of the following target Fs values:');
disp(validRates);

targetFs = input('Enter the target Fs (Hz): ');

if isempty(targetFs) || ~isnumeric(targetFs) || targetFs <= 0
    error('Invalid sample rate entered.');
end

%% 3. Resampling Processing
% resample applies an anti-aliasing low-pass filter during downsampling
y_resampled = resample(y_orig, targetFs, Fs_orig);

%% 4. Save Temporary WAV to Check File Size
tempFileName = sprintf('output_Fs_%d.wav', targetFs);
audiowrite(tempFileName, y_resampled, targetFs, 'BitsPerSample', 16);

fileInfo = dir(tempFileName);
fileSizeKB = fileInfo.bytes / 1024;

fprintf('\n--- Processing Results ---\n');
fprintf('Target Fs           : %d Hz\n', targetFs);
fprintf('Nyquist Frequency   : %.1f Hz\n', targetFs / 2);
fprintf('Exported File Size  : %.2f KB\n', fileSizeKB);

%% 5. Playback
disp('Playing resampled audio...');
player = audioplayer(y_resampled, targetFs);
playblocking(player);

%% 6. Spectral Plot (Aliasing Visualization)
N_orig = length(y_orig);
N_res = length(y_resampled);

% Frequency vectors
f_orig = (-N_orig/2 : N_orig/2 - 1) * (Fs_orig / N_orig);
f_res  = (-N_res/2  : N_res/2  - 1) * (targetFs / N_res);

% FFT Spectrum Calculation
fft_orig = abs(fftshift(fft(y_orig))) / N_orig;
fft_res  = abs(fftshift(fft(y_resampled))) / N_res;

figure('Name', sprintf('Spectrum Analysis (Fs = %d Hz)', targetFs), 'Color', 'w');

subplot(2,1,1);
plot(f_orig, 20*log10(fft_orig + 1e-6), 'b');
grid on;
title(sprintf('Original Signal Spectrum (Fs = %d Hz)', Fs_orig));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([-Fs_orig/2, Fs_orig/2]);

subplot(2,1,2);
plot(f_res, 20*log10(fft_res + 1e-6), 'r');
grid on;
title(sprintf('Resampled Signal Spectrum (Fs = %d Hz, Nyquist Limit = %g Hz)', targetFs, targetFs/2));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([-Fs_orig/2, Fs_orig/2]);