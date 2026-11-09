clc; close all; clear all;
poleValue = 1;

% Calculate the numerator and denominator coefficients
numerator = poly([1i, -1i])
denominator = poly([exp(poleValue), exp(poleValue)])

% Create the discrete-time transfer function
system = tf(numerator, denominator, 1)

% Plot the magnitude response and impulse response
figure;

subplot(2, 1, 1);
[magnitude, phase, frequency] = bode(system);
magnitude = squeeze(magnitude);

plot(frequency, magnitude);
grid on;
title('Magnitude Response');

subplot(2, 1, 2);
impulse(system);
grid on;
title('Impulse Response');

% Check whether the filter is FIR
filterObject = dfilt.df1(numerator, denominator);
isFIR = isfir(filterObject)

% Plot the pole-zero map
figure;
pzmap(system);
grid on;
title('Pole-Zero Map');