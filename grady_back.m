function M = grady_back(I)

% Compute the gradient of an image I along vertical direction
% BW differences with Neumann b.c.

[m,n]=size(I);
M=zeros(m,n);

% correct
M(1:m,2:n)=I(:,2:n)-I(:,1:n-1);
M(1:m,1)=zeros(m,1);

end

