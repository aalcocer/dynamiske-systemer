function dxdt = f(t,x)

m = 2400;
b = 240;
u = 18000; % F


A = [0 1; 0 -b/m];
B = [0 ; 1/m];

dxdt = A*x+B*u;

