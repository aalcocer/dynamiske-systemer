close all
clear all


% Example of state space to transfer function using MATLAB symbolic
% calculus
s = sym('s');
A = [-1 1 0;
     0 -1 2;
    -1 -2 -3];
B = [1 0;0  1;0 0];
C = [1 0 0;
     0 1 0]; 
D = [0 0;0 0];
I = eye(3);
H = C*inv(s*I-A)*B

% Same result using matlab built in function ss2tf
[Num,Den] = ss2tf(A,B,C,D,1)



