%% Verification of Associative and Distributive Properties of Convolution

clearvars;
close all;
clc;

% Define the input signal and its origin.
x = [1 5 10];
originX = 1;
nX = (0:length(x) - 1) - originX + 1;

% Define the first impulse response and its origin.
h1 = [5 15];
originH1 = 0;
nH1 = (0:length(h1) - 1) - originH1 + 1;

% Define the second impulse response and its origin.
h2 = [20 25];
originH2 = 1;
nH2 = (0:length(h2) - 1) - originH2 + 1;

% Verify the associative property of convolution.
yAssociative1 = conv(x, conv(h1, h2));
yAssociative2 = conv(conv(x, h1), h2);

% Verify the distributive property of convolution.
yDistributive1 = conv(x, h1 + h2);
yDistributive2 = conv(x, h1) + conv(x, h2);

% Calculate the sample indices for the convolution outputs.
nAssociative = ...
    (nX(1) + nH1(1) + nH2(1)) : ...
    (nX(end) + nH1(end) + nH2(end));

nDistributive = ...
    (nX(1) + nH1(1)) : ...
    (nX(end) + nH1(end));

% Plot the input signals and the convolution results.
figure;

subplot(3, 3, 1);
stem(nX, x);
title('Input Signal x(n)');
xlabel('n_x');
ylabel('x(n)');
grid on;

subplot(3, 3, 2);
stem(nH1, h1);
title('Impulse Response h_1(n)');
xlabel('n_{h_1}');
ylabel('h_1(n)');
grid on;

subplot(3, 3, 3);
stem(nH2, h2);
title('Impulse Response h_2(n)');
xlabel('n_{h_2}');
ylabel('h_2(n)');
grid on;

subplot(3, 3, 4);
stem(nAssociative, yAssociative1);
title('x(n) * (h_1(n) * h_2(n))');
xlabel('n_{y_1}');
ylabel('y_1(n)');
grid on;

subplot(3, 3, 5);
stem(nAssociative, yAssociative2);
title('(x(n) * h_1(n)) * h_2(n)');
xlabel('n_{y_2}');
ylabel('y_2(n)');
grid on;

subplot(3, 3, 6);
stem(nDistributive, yDistributive1);
title('x(n) * (h_1(n) + h_2(n))');
xlabel('n_{y_3}');
ylabel('y_3(n)');
grid on;

subplot(3, 3, 7);
stem(nDistributive, yDistributive2);
title('(x(n) * h_1(n)) + (x(n) * h_2(n))');
xlabel('n_{y_4}');
ylabel('y_4(n)');
grid on;