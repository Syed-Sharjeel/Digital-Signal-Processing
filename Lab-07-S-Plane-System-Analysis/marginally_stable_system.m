clear;
close all;
clc;

% Define numerator coefficients using zeros at ±j*pi/2
zeroLocations = [1i*pi/2, -1i*pi/2];
numerator = poly(zeroLocations);

% Calculate and display system zeros
systemZeros = roots(numerator);
disp('System Zeros:');
disp(systemZeros);

% Pole Location at 0

% Define denominator and construct transfer function
poleLocation = 0;
denominator = poly([poleLocation, poleLocation]);
systemPoles = roots(denominator);
system = tf(numerator, denominator);

disp('Poles for p = 0:');
disp(systemPoles);

% Plot pole-zero map, frequency response and impulse response
figure('Name', 'System Response for p = 0');

subplot(3,1,1);
pzmap(system);
xlim([-2 2]);
ylim([-4 4]);
title('Pole-Zero Map (p = 0)');
grid on;

subplot(3,1,2);
[magnitude, ~, frequency] = bode(system);
magnitude = squeeze(magnitude);
plot(frequency, magnitude);
title('Frequency Response');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');
grid on;

subplot(3,1,3);
impulse(system);
title('Impulse Response');
grid on;

% Determine whether the system is FIR or IIR
filterObject = dfilt.df1(numerator, denominator);
isFIR = isfir(filterObject);
disp(['Is FIR: ', num2str(isFIR)]);