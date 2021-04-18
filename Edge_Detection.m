clc; clear; close all;
% Edge Detection
% Robert, Prewitt & Sobel Edge Detection
I = imread('onion.png');
Gray_I = rgb2gray(I);
% figure
% imshow(Gray_I); title('Gray Image');

Out_I1 = edge(Gray_I, 'roberts');
Out_I2 = edge(Gray_I, 'prewitt');
Out_I3 = edge(Gray_I, 'sobel');

figure;
subplot(2,1,1)
imshow(I); title('Original Image');
imshow(Gray_I); title('Gray Image');

figure; 
subplot(3,1,1)
imshow(Out_I1); title('Roberts Edge Detection');
subplot(3,1,2)
imshow(Out_I2); title('Prewitt Edge Detection');
subplot(3,1,3)
imshow(Out_I3); title('Sobel Edge Detection');