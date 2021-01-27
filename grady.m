function M = grady(I)

% Compute the gradient of an image I along vertical direction
% Forward differences with Neumann b.c.

[m,n]=size(I);
M=zeros(m,n);

M(1:m,1:n-1)=-I(:,1:n-1)+I(:,2:n);
M(1:m,n)=zeros(m,1); 
