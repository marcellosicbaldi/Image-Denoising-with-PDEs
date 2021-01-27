function im_noise = addnoise(im,relerr)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% L'IMMAGINE IN INGRESSO DEV'ESSERE DOUBLE!!! %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

siz = size(im);
m = siz(1); n = siz(2);
imvet=reshape(im,m*n,1);
%relerr = input ('Relative Norm of Noise: ');
seed =1111; 
randn('state',seed);
ee = randn(m*n,1);
evet = relerr*ee*norm(imvet,2)/norm(ee,2);
emat=reshape(evet,siz);
im_noise = im + emat;