function A_ld=linearParabolic2D(A,iter)

% Method of lines, EXPLICIT
% First: discretize space! laplacian.m
% Then: solve the system of ODEs using explicit Euler.

A_ld=A;
dt = 0.2; % temporal step -> needs to be < h^2/4, h=1.
for l = 1:iter
    A_ld = A_ld + dt.*laplacian(A_ld); 
end




