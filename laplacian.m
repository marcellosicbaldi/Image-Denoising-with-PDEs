function lap = laplacian(im)
% If opt = 1 -> Homogeneous Neumann BC
% If opt = 0 -> Dirichlet BC 

opt = 1;
[m, n] = size(im);
lap = Dxx(im,opt) + Dyy(im,opt); % matrix where we sum up the second derivative in x and y


