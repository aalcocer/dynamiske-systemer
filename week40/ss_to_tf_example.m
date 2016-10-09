close all
clear all


% Example of state space to transfer function using MATLAB symbolic
% calculus

s = sym('s');

A = [0 1 0;
     0 0 1;
    -1 -2 -3];
B = [0; 0; 1];
C = [1 0 0]; 
D = 0;
I = eye(3);

H = C*inv(s*I-A)*B


% Try also matlab built in function ss2tf

[Num,Den] = ss2tf(A,B,C,D)

N = [1]; % numerator coefficients
D = [1 3 2 1]; % denominator coefficients s^3 + 3*s^2 + 2*s + 1
