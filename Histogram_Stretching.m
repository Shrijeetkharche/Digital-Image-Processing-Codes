clc; clear; close all;
%Histogram Stretching
S_Min = 20;
S_Max = 255;
I = imread('cameraman.tif');
I_Gray = rgb2gray(I);
[R, C] = size(I_Gray);  % Size of the gray image
L = R * C;              % Total number of pixels
I_vec = I_gray(:);      % Vectorising matrix
I_sort = sort(I_vec);   % Sorting the values in ascending values
I_unq = unique(I_sort); % Finding unique values
I_Min = min(I_unq);
I_Max = max(I_unq);

% Slope of the image
Slope = (S_Max-S_Min)./(I_Max-I_Min);
S_new = Slope.*(I_unq-I_Min)+S_Min;

% Stretching the image
I_stretched = zeros(R,C);
for jj = 1:length(I_unq)
    I_stretched(I_Gray == I_unq(jj)) = S_new(jj);
end
I_stretched = uint8(I_stretched);figure;
subplot(2,2,1)
imshow(I_Gray); title('Original Gray Image');
subplot(2,2,2)
imshow(I_stretched); title('Image after stretching');
subplot(2,2,3)
histogram(I_Gray); title('Histogram for Original Image');
subplot(2,2,4)
histogram(I_stretched); title('Histogram for Stretched Image');