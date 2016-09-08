A = [2 1 -2; 1 4.5 5; -2 3 -8];
y = [1; 4; -1];

% In order to solve A*x=y where x = [a b c]'
% we multiply from the left by the inverse of A

inv(A)*A % check that inv(A)*A is the identity matrix

x = inv(A)*y

a = x(1)
b = x(2)
c = x(3)
