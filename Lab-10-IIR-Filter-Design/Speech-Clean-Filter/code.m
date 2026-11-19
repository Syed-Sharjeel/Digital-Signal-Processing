% Read the input speech signal and get its sampling frequency
[x, fs] = audioread('Input-Files/speech.wav');

% Convert stereo to mono if necessary for processing
if size(x, 2) > 1
    x = mean(x, 2);
end

% Generate and add a 1500 Hz sinusoidal noise to the speech signal
t = (0:length(x)-1)' / fs;
noise = 0.3 * sin(2 * pi * 1500 * t);
x_noisy = x + noise;

% Design a 4th-order Butterworth bandstop filter to attenuate the 1500 Hz noise
f_notch = 1500;
w_stop = [f_notch - 40, f_notch + 40] / (fs / 2);
[b, a] = butter(4, w_stop, 'stop');

% Compute and plot the FFT of the noisy speech signal before filtering
N = length(x_noisy);
f_axis = (0:N-1)*(fs/N);
X_noisy_fft = abs(fft(x_noisy)) / N;

figure;
plot(f_axis(1:floor(N/2)), X_noisy_fft(1:floor(N/2)));
title('FFT Spectrum of Noisy Speech Signal (Before Filtering)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Play the noisy speech signal, pause for its duration, then play the cleaned speech
sound(x_noisy, fs);
pause(length(x_noisy)/fs + 0.5);

% Apply the filter to attenuate the noise and obtain the clean speech signal
x_clean = filter(b, a, x_noisy);

% Play the filtered clean speech signal
sound(x_clean, fs);
audiowrite('Output-Files/cleaned_speech.wav', x_clean, fs);