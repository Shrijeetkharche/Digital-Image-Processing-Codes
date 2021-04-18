% Weiner Filter
clc; close all; clear;
I = imread('cameraman.tif');
Gray_I = rgb2gray(I);
Gray_I = im2double(Gray_I);
M = 0;
V = 0.02;
Gray_I = imnoise(Gray_I, 'gaussian', M, V);
figure, imshow(Gray_I);
title(sprintf('Noisy Image (Gaussian: Mean = %d, Variance = %f)', M, V));

% Wiener Filtering
% win_size x win_size
Win_S = 7;
[Out, N] = wiener2(Gray_I, [Win_S, Win_S]);
figure
subplot(1,2,1), imshow(Gray_I);
title(sprintf('Noisy Image\r\n(Gaussian: Mean = %d, Variance = %f)', M, V));
subplot(1,2,2), imshow(Out);
title(sprintf('Output Image\r\n(Noise Power Estimate = %f)\r\n(Using %dx%d window)',N,Win_S,Win_S));
