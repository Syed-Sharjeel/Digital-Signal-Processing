% Clear workspace, command window, and close figures
clc;
clear;
close all;

% Load source images
componentsImage = imread('Image-Files/fruits.jpg');
templateImage = imread('Image-Files/mango.png');

% Convert images to grayscale
componentsGray = rgb2gray(componentsImage);
templateGray = rgb2gray(templateImage);

% Compute 2D normalized cross-correlation
correlationMap = normxcorr2(templateGray, componentsGray);

% Find peak correlation coordinates
[maxCorrValue, maxCorrLinearIndex] = max(correlationMap(:));
[yPeak, xPeak] = ind2sub(size(correlationMap), maxCorrLinearIndex);

% Calculate bounding box top-left location corrected for padding offset
[templateRows, templateCols] = size(templateGray);
yTopLeft = yPeak - templateRows + 1;
xTopLeft = xPeak - templateCols + 1;

% Display matching results
figure('Name', '2D Image Template Matching via Cross-Correlation', 'NumberTitle', 'off');

% Plot original full image
subplot(3, 1, 1);
imshow(componentsGray);
title('Original Scene Image');

% Plot template to detect
subplot(3, 1, 2);
imshow(templateGray);
title('Searched Template Image');

% Plot target with bounding box highlight
subplot(3, 1, 3);
imshow(componentsGray);
hold on;
rectangle('Position', [xTopLeft, yTopLeft, templateCols, templateRows], ...
          'EdgeColor', 'r', ...
          'LineWidth', 2);
title(sprintf('Detected Match (Peak Correlation: %.2f)', maxCorrValue));
hold off;