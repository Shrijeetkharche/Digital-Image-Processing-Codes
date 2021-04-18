clc; close all; clear;
% Image Morphling
% Reading an Image
I = imread('TestImage.jpg');

% RGB to Gray Image Conversion
Gray_I = rgb2gray(I);
% figure
% imshow(Gray_I);
% title('Gray Image');

A = imresize(Gray_I, [400 500]);
BW_I = imbinarize(A);
S = strel('square', 3);

% Performing Erosion
Out_I = imerode(BW_I, S);
Out_I2 = imdilate(BW_I, S);

subplot(3,1,1)
imshow(BW_I); title('Original BW Image');
subplot(3,1,2)
imshow(Out_I); title('Erode Image');
subplot(3,1,3)
imshow(Out_I2); title('Dilated Image');