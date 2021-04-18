clc; clear; close all;
% Inverse Filtering (Image Restoration)
% Reading Image
I = imread('onion.png');
I = im2double(I);

H = fspecial('gaussian', 15, 2);
Blurred = imfilter(I, H, 'circular');
Noise = 0.001*randn(size(I));
G = Blurred + Noise;
figure
imshow(G, []); title('');

G_FFT = fftshift(fft2(G));
figure
imshow(log(abs(G_FFT), []));

H = ifftshift(fspecial('gaussian',size(I), 2));
figure
imshow(H, []);
F = zeros(size(I));
R = 70;
for u=1:size(I,2)
   for v=1:size(I,1)
       du = u - size(I,2)/2;
       dv = v - size(I,2)/2;
       if du^2 + dv^2 <= R^2
            F(v,u) = G_FFT(v,u)/H(v,u);
       end
   end
end
figure
imshow(log(abs(fftshift(F)), []));
fRestored = real(ifft2(ifftshift(F)));
figure
imshow(fRestored, []);

