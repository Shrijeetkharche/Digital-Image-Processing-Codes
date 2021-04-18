% Exercise 2
% Histogram Equalization
clc; clear; close all;

% Input image pixel values.
A = [52	55	61	59	79	61	76	61;
    62	59	55	104	94	85	59	71;
    63	65	66	113	144	104	63	72;
    64	70	70	126	154	109	71	69;
    67	73	68	106	122	88	68	68;
    68	79	60	70	77	66	58	75;
    69	85	64	58	55	61	65	83;
    70	87	69	68	65	73	78	90];

rc=size(A);
A=double(A);

% Loops for Getting the Histogram of the original image
hist1 = zeros(1,256);
for i=1:rc(1)
    for j=1:rc(2)
        for k=0:255
            if A(i,j)==k
                hist1(k+1)=hist1(k+1)+1;
            end
        end
    end
end

% Calculating unique pixel values and their frequency.
[un_A, ~, indAval] = unique(A);
[a,b] = size(un_A);

X = zeros(a,4);
for i = 1:length(un_A)
    X(i,1) = un_A(i); 
    X(i,2) = length(find(A == un_A(i)));
end

% Calculating CDF of frequency column.
X(1,3) = X(1,2);
for i=2:a
    X(i,3)=X(i-1,3)+X(i,2);
end

% Normalizing CDF values
for i=1:a
    temp = ((X(i,3)-X(1,3))/(rc(1)*rc(2)-X(1,3)))*255;
    X(i,4)=round(temp);
end

% Generating Output Image.
% Replacing the original pixel value with updated normalized CDF values.
Avalnew = X(:,4);
Anew = Avalnew(indAval);
Anew = reshape(Anew, size(A));

% Loop for Getting the Histogram of the output image.
hist2 = zeros(1,256);
for i=1:rc(1)
    for j=1:rc(2)
        for k=0:255
            if Anew(i,j)==k
                hist2(k+1)=hist2(k+1)+1;
            end
        end
    end
end

figure
subplot(2,2,1);
imshow(uint8(A)); title('\fontname{Times} Input Image(Original)');
subplot(2,2,3);
imshow(uint8(Anew)); title('\fontname{Times} Output Image(Equilized)');

subplot(2,2,2);
stem(hist1); title('\fontname{Times} Histogram of Original image');
subplot(2,2,4);
stem(hist2); title('\fontname{Times} Histogram of Equilized image');