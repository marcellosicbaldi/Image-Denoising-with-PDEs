function M = gradx(I)

% Compute the gradient of an image I along horizontal direction
% Forward differences with Neumann b.c.


[m,n]=size(I);
M=zeros(m,n);

M(1:m-1,1:n)=-I(1:m-1,:)+I(2:m,:) ;
M(m,1:n)=zeros(1,n); 

