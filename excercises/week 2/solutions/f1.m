function dxdt = f1(t,x)
% function with t as argument as required by ode45 matlab function
% t is not used but needs to be in function definition

% f1 has m,b,F as constants defined inside function, whereas f2 accepts
% them as arguments


m = 2400;
b = 240;
u = 18000; % F

A = [0 1; 0 -b/m];
B = [0 ; 1/m];

dxdt = A*x+B*u;

