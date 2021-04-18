clc; close all; clear;
% Median Filter
% Reading an Image
I = imread('cameraman.tif');
I_SP = imnoise(I, 'salt & pepper', 0.1);
figure
subplot(2,1,1)
imshow(I); title('Original Image');
subplot(2,1,2)
imshow(I_SP); title('Noisy Image(with Salt and Pepper Noise)');

A = fspecial('average');
Im_I = filter2(A, I_SP);
figure
imshow(uint8(Im_I));
% Output Image
Med_I = medfilt2(I_SP);
figure
imshow(Med_I); title('Filtered Image');
