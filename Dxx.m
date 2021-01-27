function der = Dxx(im,opt)

% Effettua una derivazione seconda alle differenze finite lungo le righe
% della matrice
[m n] = size(im);
der = (im([2:m m],:) - 2*im + im([1 1:m-1],:)); 


% Dirichlet 
if opt==0
    der(1,:) = zeros(1,n);
    der(m,:) = zeros(1,n);
    der(:,1) = zeros(m,1);
    der(:,n) = zeros(m,1);
end









