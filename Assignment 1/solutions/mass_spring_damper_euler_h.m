function [t,X,a] = mass_spring_damper_euler_h(x0,h,Tend)


b = 1; % damping in N/(m/s)
m = 1; % mass in kg
k = 1; % spring constant in N/m
F = 5; % Input force in Newtons

u = F; % input vector is 4x1
A = [0 1;
    -k/m -b/m]; % A matrix is 2x2
B = [0; 
     1/m]; % B matrix is 2x1

% h, and Tend are given as arguments 
t = (0:h:Tend)'; % time vector
N = length(t); % number fo points

%x0 = [1; 0]; % initial state is 2x1, contains initial position and initial velocity

X = zeros(N,2); % matrix to store result
a = zeros(N,1); % vector to store acceleration
% X has two columns and N rows. Each row correspons to a time sample.
% Column 1 contains position x1, ad column 2 contains velocity x2
X(1,:) = x0'; % store intial state in the first row
x = x0; 
for i=1:N-1
    xdot = A*x+B*u; % determine time derivative of state
    x = x + h*xdot; % forward Euler method
    X(i+1,:) = x'; % store state in the i'th row
    % Note that xdot contains velocity and acceleration
    a(i) = xdot(2); % xdot is 2x1, the second element is acceleration
end

