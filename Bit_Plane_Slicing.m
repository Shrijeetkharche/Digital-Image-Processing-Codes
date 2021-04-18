% Exercise 1
% Bit Plane Slicing

% Reading Image
I = imread('TestImage.jpg');
fprintf('The Size of RGB Image is : ');
disp(size(I));

% RGB to Gray Image Conversion
Gray_I = rgb2gray(I);
figure
imshow(Gray_I);
title('Gray Image');
fprintf('The Size of Gray Image is : ');
disp(size(Gray_I));

Gray_In = double(Gray_I); 

figure
for i=0:7
    subplot(2,4,i+1); imshow(BPS(Gray_In, i)); 
    title(sprintf('Bit Plane %d',i));
end

function A = BPS(p,q)
    A = mod(floor(p/(2^q)), 2);
end
