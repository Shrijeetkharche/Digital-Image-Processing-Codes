clc; close all; clear;
%%
%Method 1: Gaussian filter
%Read an Image
I = imread('coins.png');
Noisy_I = imnoise(I,'Gaussian',0.04,0.003);
%Image with noise
figure,imshow(Noisy_I);  title('Noisy Image');

H = fspecial('Gaussian',[9 9],1.76);
Gaussian_F = imfilter(Noisy_I,H);
figure,imshow(Gaussian_F);  title('Filtered Image');

%%
% Method 2: Gaussian filter
%Read an Image
I = imread('coins.png');
Noisy_I = imnoise(I, 'salt & pepper', 0.05);

R_channel = Noisy_I(:, :, 1);
G_channel = Noisy_I(:, :, 2);
B_channel = Noisy_I(:, :, 3);

H = fspecial('gaussian', [10 10], 4);

R_channel = imfilter(R_channel, H);
G_channel = imfilter(G_channel, H);
B_channel = imfilter(B_channel, H);

F = cat(3,R_channel, G_channel, B_channel);

figure
subplot(2, 1, 1);
imshow(Noisy_I); title('Noisy Image');
subplot(2, 1, 2);
imshow(F); title('Image After Noise Removal');