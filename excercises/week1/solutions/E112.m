A = [1 2 6.5 -2; 0 2.3 3 0; 3.2 0 3.5 7; -2 2 1.25 9];

b = [0;-2; 1; 4];

% In order to solve A*x=b where x = [x1 x2 x3]'
% we multiply both sides of equation from the left by the inverse of A
% inv(A)*A*x=inv(A)*b
% 
inv(A)*A % check that inv(A)*A is the identity matrix

x = inv(A)*b

% Note that 

n = size(A); 
I = eye(n); % eye returns identity matrix of dimension n

E = I-inv(A)*A % This is supposed to be a matrix full of zeros
% It contains elements in the order of 1e-15 (0.000000000000001) which is
% zero except the numerical accuracy of doubles in matlab. Note that in matlab the next larger number to 1.0
% is 1.0+eps where eps is 2.2204e-16. 

% Verify that we have solved the linear system A*x = b
best = A*x % reconstructed b from solution x
b % original b
b-best % error, note it is also in the order of 1e-15 which is technically zero 
% as far as us engineers are concerned.