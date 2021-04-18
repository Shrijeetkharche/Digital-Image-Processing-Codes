clc; close all; clear;
% Exercise 3
% Part 1: Arithmetic Operations
x = imread('lighthouse.png');
y = imread('Test.png');
% Bitwise Opeartions
u = rgb2gray(x);
v = rgb2gray(y);
m = imresize(u, [256,256]);
n = imresize(v, [256,256]);

% Performing Addition
Sum = imadd(m,n);
figure
imshow(Sum); title('Summition of Images(Image1 + Image2)');

% Performing Subtraction
Diff = imsubtract(m,n);
Diff2 = imsubtract(n,m);
figure
subplot(2,1,1)
imshow(Diff); title('Image1 - Image2');
subplot(2,1,2)
imshow(Diff2); title('Image2 - Image1');

% Performing Multiplication
m1 = im2double(m);
n1 = im2double(n);

Mul = immultiply(m1, n1);
figure
imshow(Mul); title('Multiplication of Images');

% Performing Division
Div1 = imdivide(m1, n1);
Div2 = imdivide(n1, m1);

figure
subplot(2,1,1)
imshow(Div1); title('Image1 / Image2');
subplot(2,1,2)
imshow(Div2); title('Image2 / Image1');

% Part 2: Logical Operation
x = imread('lighthouse.png');
y = imread('Test.png');
% Bitwise Opeartions
u = rgb2gray(x);
v = rgb2gray(y);
m = imresize(u, [256,256]);
n = imresize(v, [256,256]);

AND = bitand(m, n);     % AND Operation
OR = bitor(m, n);       % OR Operation
NOT1 = bitcmp(m);       % NOT Operation 
NOT2 = bitcmp(n);
XOR = bitxor(m, n);     % XOR Operation
NAND = bitcmp(AND);     % NAND Operation
NOR = bitcmp(OR);       % NOR Operation
EXOR = bitcmp(XOR);     % EXOR Operation

figure
subplot(4,2,1); imshow(AND); title('Logical AND');
subplot(4,2,2); imshow(OR); title('Logical OR');
subplot(4,2,3); imshow(NOT1); title('Logical NOT1');
subplot(4,2,4); imshow(NOT2); title('Logical NOT2');
subplot(4,2,5); imshow(XOR); title('Logical XOR');
subplot(4,2,6); imshow(NAND); title('Logical NAND');
subplot(4,2,7); imshow(NOR); title('Logical NOR');
subplot(4,2,8); imshow(EXOR); title('Logical E-XOR');

% Part 3: Geometric Operations
I = imread('cameraman.tif');
% imshow(I)
tf2d = affine2d([1 0 0; .5 1 0; 0 0 1]);
J = imwarp(I,tf2d);
figure
imshow(J)