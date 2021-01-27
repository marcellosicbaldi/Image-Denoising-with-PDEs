close all
clear 

%% Load the image and add noise
x_image = imread('mano.jpg');
    
A_d=double(x_image);
siz = size(A_d);
if length(siz)>2
    A = A_d(:,:,1);
else
    A = A_d;
end
figure
m = siz(1); n = siz(2);

sd = 0.3; 
A_n = addnoise(A,sd); 
 
figure(1)
subplot(2,3,1)
imshow(uint8(A));
title('Original Image'); 
subplot(2,3,2)
imshow(uint8(A_n));
title('Noisy Image');

%% 2D Heat Equation
iter_ld = 55;
A_heat = linearParabolic2D(A_n,iter_ld); 
subplot(2,3,3)
imshow(uint8(A_heat))
title('Heat Equation');

%% Perona-Malik original
iter_pm = 55;
K=10;
A_PM=NL_diffusion(A_n,'pm2',iter_pm,K);
figure(1)
subplot(2,3,4)
imshow(uint8(A_PM));
title('Perona Malik Original');

%% Perona-Malik new
iter_da = 155;
A_DA = Diffusion_Advection(A_n,K,iter_da); 
figure(1)
subplot(2,3,5)
imshow(uint8(A_DA));
title('Perona Malik New');

%% Total Variation
AA=double(A_n);
A_TV=calc_tv(AA);
figure(1)
subplot(2,3,6)
imshow(uint8(A_TV));
title('Total Variation');

%% Compute error in Frobenius norm 
erroreHeat = norm(A_heat - A,'fro') / norm(A,'fro')
error_PM1 = norm(A_PM - A,'fro') / norm(A,'fro')
error_DA = norm(A_DA - A,'fro') / norm(A,'fro')
error_TV = norm(A_TV - A,'fro') / norm(A,'fro')
