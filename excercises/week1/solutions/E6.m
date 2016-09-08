A = [1 0 0.2; 8 -3 3; -2 0.4 1];
% or
A = [1 0 0.2;... 
     8 -3 3;...
     -2 0.4 1];

B = [1 2; 4 -1; 2 3];
C = [0 1; -2 3];

x'*x

x'*b % this returns an error as dimensions do not match

x*b

b*x

A*x

b*A*x

x'*A*b'

A*B

B'*x

B*C

A*B*C


