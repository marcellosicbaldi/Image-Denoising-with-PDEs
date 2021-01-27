function A_new = Diffusion_Advection(A,K,iter)

% Explicit MOL for the diffusion + UPWIND for the advection 

dt = 0.2; % temporal step

A_new = A;
for l = 1:iter
    
    % Computing the diffusion function
    Gx=gradx_back(A_new); 
    Gy=grady_back(A_new);
    G_mag2 = Gx.^2+Gy.^2;
    g = 1./(1+G_mag2/K);
    
    % Plotting the detected egdes at each iteration
    figure(10)
    imagesc(g.^2);
    colormap('gray')
     
    % Computing the gradient of the diffusion function
    gradx_g = gradx_back(g);
    grady_g = grady_back(g);
 
    % Defining the coefficients for the upwind scheme
    max_gx = max(gradx_g,0);
    min_gx = min(gradx_g,0);
    max_gy = max(grady_g,0);
    min_gy = min(grady_g,0);
    
    % Computation of the next image
    A_new = A_new + dt*(g.*laplacian(A_new) + ...
    max_gx.*gradx_back(A_new) + min_gx.*Gx + ...
    max_gy.*grady_back(A_new) + min_gy.*Gy);
  
end




