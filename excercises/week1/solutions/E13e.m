close all
clear all

% run script with f5

N = 100; % number of samples
x = linspace(-1,1,N)'; % N equally spaced points between -1 and 1
% transpose to obtain a column vector of dimansion Nx1
% check with size(x)
s = 2; % standard deviation
y = 0.4*x.^3 +x.^2 -1.5*x +1 +s*randn(N,1); % noisy samples of polynomial realtionship

figure(1)
plot(x,y,'ro')
grid on
xlabel('x')
ylabel('y')


% question b
A = [x.^3 x.^2 x ones(N,1)]; % A is a Nx4 matrix 
size(A)
% We want to solve the system A*theta = y
theta = inv(A'*A)*A'*y % least square estimate
% theta is a 4x1 vector
yest = A*theta; % reconstructed y points using estimated coefficients

figure(2)
plot(x,y,'ro')
hold on
plot(x,yest,'b.-')
hold off
grid on
xlabel('x')
ylabel('y')
legend('Measurements','3rd order Polynomial fit')

% question e
A2 = [x.^2 x ones(N,1)]; % A2 is now a Nx3 matrix 
theta2 = inv(A2'*A2)*A2'*y % least square estimate
% theta is now a 3x1 vector
yest2 = A2*theta2; % reconstructed y points using 2nd order fit

A4 = [x.^4 x.^3 x.^2 x ones(N,1)]; % A4 is now a Nx5 matrix 
theta4 = inv(A4'*A4)*A4'*y % least square estimate
% theta is now a 5x1 vector
yest4 = A4*theta4; % reconstructed y points using 4th order fit

figure(3)
plot(x,y,'ro')
hold on
plot(x,yest2,'g.-')
plot(x,yest,'b.-')
plot(x,yest4,'k.-')
hold off
grid on
xlabel('x')
ylabel('y')
legend('Measurements','2rd order Polynomial fit','3rd order Polynomial fit','4rd order Polynomial fit')



