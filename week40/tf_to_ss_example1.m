close all
clear all


% Example of transfer function to state space conversion using MATLAB
N = [2 1]; % numerator coefficients 2s + 1
D = [1 3 1]; % denominator coefficients s^2 + 3*s + 1
[A,B,C,D] = tf2ss(N,D) % return realization in controllable canonical form



