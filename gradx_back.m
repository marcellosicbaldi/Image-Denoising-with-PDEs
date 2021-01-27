function M = gradx_back(I)

% Compute the gradient of an image I along horizontal direction
% BW differences with Neumann b.c.


[m,n]=size(I);
M=zeros(m,n);


% correct
M(2:m,1:n)=I(2:m,:)-I(1:m-1,:);
M(1,1:n)=zeros(1,n); 

end

