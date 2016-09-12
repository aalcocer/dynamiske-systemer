function dxdt = f2(x,m,b,F)


u =  F;

A = [0 1; 0 -b/m];
B = [0 ; 1/m];

dxdt = A*x+B*u;

