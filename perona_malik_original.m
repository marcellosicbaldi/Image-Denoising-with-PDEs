close all
clear 

x_image = imread('mano.JPG');

A_d=double(x_image);
siz = size(A_d);
if length(siz)>2
    A = A_d(:,:,1);
else
    A = A_d;
end
m = siz(1); n = siz(2);

%Add noise  
noise = 0.3;

A_n = addnoise(A,noise); 

A_n = imgaussfilt(A_n);
ssim(A_n,A)
figure(1)
imshow(uint8(A));
title('Original Image'); 
figure(2)
imshow(uint8(A_n));
title('Noisy Image');

A_n = imgaussfilt(A_n, 1.5);

K1=10; %25;%45;
iter_PM = 50;
A_PM=NL_diffusion(A_n,'pm2',iter_PM,K1);
figure(3)
imshow(uint8(A_PM));
title('Perona Malik');
ssim_PM = ssim(A_PM,A)


