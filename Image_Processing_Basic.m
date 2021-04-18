% warning('off', 'Images:initSize:adjustingMag');
clc; close all; clear;
% Reading Image
I = imread('E:\Third Year\6th_Sem\DIP\TestImage.jpg');
fprintf('The Size of RGB Image is : ');
disp(size(I));
% s = size(I);

% Display Image in 8-bit format.
figure
imshow(I);
title('Normal Image');
% Display Image in scaled axes.
% figure
% imagesc(I);

% Display individual RGB component of the image.
figure
subplot(131); imagesc(I(:,:,1)); title('Red'); 
subplot(132); imagesc(I(:,:,2)); title('Green'); 
subplot(133); imagesc(I(:,:,3)); title('Blue'); 

% RGB to Gray Image Conversion
Gray_I = rgb2gray(I);
figure
imshow(Gray_I);
title('Gray Image');
fprintf('The Size of Gray Image is : ');
disp(size(Gray_I));

% Gray to Binary Image Conversion
BW_I = imbinarize(Gray_I);
figure
imshow(BW_I);

% Plotting Histogram of Gray Image.
figure
imhist(Gray_I);

% Finding the average value of pixel intensity
MeanIntensity = mean(I(:));
fprintf('The Average value of Pixel Intensity is : ');
disp(MeanIntensity);
