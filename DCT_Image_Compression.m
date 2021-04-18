clc; clear; close all
%DCT Image Compression
[~,~] = uigetfile('*.jpg*','select the grayscale image'); 
x=FName; y=PName;
FWP=strcat(y,x);
I_temp = imread(FWP);
I_Original=I_temp;
I=I_Original;

%Plotting RGB Image.
Img = rgb2gray(I_Original);
figure
imshow(I); title('Original Image');
imwrite(I,'Original.png')
D= size(I,2);
Samples_8 =(D /8);
for Colr=1:3
    for i=1:size(I,1)
        R = dct(double(I(i,:,Colr)));
        Col_8(i,:,Colr)= idct(R(1:Samples_8),D);
    end
end
dat_2 =size(I,1);
Samples_8th=floor(dat_2/8);
Col_8F=[];
for k=1:3 %all color layer
    for i=1:size(I,2) %all coloumn
        DCT_8 = dct(double(Col_8(:,i,k)));
        Col_8F(:,i,k)= idct(DCT_8(1:Samples_8th),dat_2);
    end
end
dct_1 =(uint8(Col_8));
figure
imshow(dct_1); title('COMPRESSED IMAGE');
imwrite(dct_1,'OUT.jpg')