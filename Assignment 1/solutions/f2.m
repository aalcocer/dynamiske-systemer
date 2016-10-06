function xdot = f2(x_init)

k = 1; %fjærkonstant
b = 4; %dempningskonstant
F = 5; %ytre krefter
m = 1; %masse


u = F;
A = [ 0 1 ; -k/m -b/m];
B = [0 1/m]';
x = x_init; 

xdot = A*x+B*u;


