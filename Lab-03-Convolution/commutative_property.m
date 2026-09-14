%% Verification of the Commutative Property of Convolution

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

% Perform convolution in both possible orders.
yXH = conv(x, h);
yHX = conv(h, x);

fprintf('\nconv(x, h) = ');
fprintf('%d ', yXH);

fprintf('\n\nconv(h, x) = ');
fprintf('%d ', yHX);
fprintf('\n');

% Plot the input signals and both convolution results.
figure;

subplot(2, 2, 1);
stem(nX, x);
title('Input Signal x(n)');
xlabel('n_x');
ylabel('x(n)');
xlim([nH(1) - 1, nH(end) + 1]);
grid on;

subplot(2, 2, 2);
stem(nH, h);
title('Impulse Response h(n)');
xlabel('n_h');
ylabel('h(n)');
xlim([nH(1) - 1, nH(end) + 1]);
grid on;

subplot(2, 2, 3);
stem(yXH);
title('Convolution Output x(n) * h(n)');
xlabel('n_y_1');
ylabel('y_1(n)');
xlim([nH(1) - 1, nH(end) + 1]);
grid on;

subplot(2, 2, 4);
stem(yHX);
title('Convolution Output h(n) * x(n)');
xlabel('n_y_2');
ylabel('y_2(n)');
xlim([nH(1) - 1, nH(end) + 1]);
grid on;
