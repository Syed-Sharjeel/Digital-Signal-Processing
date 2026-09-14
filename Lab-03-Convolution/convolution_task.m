%% Convolution of Two Discrete-Time Signals

clearvars;
close all;
clc;

% Define the input signal and its origin.
x = [0 0 1 0 0];
originX = 2;
nX = (0:length(x) - 1) - originX;

% Define the impulse response and its origin.
h = [3 2 1 -2 1 0 -4 0 3];
originH = 2;
nH = (0:length(h) - 1) - originH + 1;

% Perform convolution between the input signal and impulse response.
y = conv(x, h);

fprintf('\nconv(x, h) = ');
fprintf('%d ', y);
fprintf('\n');

% Plot the input signal, impulse response, and convolution output.
figure;

subplot(3, 1, 1);
stem(nX, x);
title('Input Signal x(n)');
xlabel('n_x');
ylabel('x(n)');
xlim([nH(1) - 1, nH(end) + 1]);
grid on;

subplot(3, 1, 2);
stem(nH, h);
title('Impulse Response h(n)');
xlabel('n_h');
ylabel('h(n)');
xlim([nH(1) - 1, nH(end) + 1]);
grid on;

subplot(3, 1, 3);
stem(y);
title('Convolved Output y(n)');
xlabel('n_y');
ylabel('y(n)');
xlim([nH(1) - 1, nH(end) + 1]);
grid on;