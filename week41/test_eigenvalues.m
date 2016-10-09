
A = [1 2 3;
     0 1 -1;
     1 8 0];
 
e =  eig(A); % vector with eigenvalues
[V,D] = eig(A); % D diagonal matrix with eigenvalues
% V is matrix which columns are eigenvectors