close all
clear all

N = 20; % number of cars
K = 0.2*ones(N,1); % vector of driver constants all equal to 0.1
%K = 0.1+0.3*rand(N,1); % vector of random driver constants

% Determine system matrix 
A_11 = zeros(N);
A_12 = eye(N);
A_21 = zeros(N); % inititalize matrix to all zeros
for i=2:N
   A_21(i,i-1) = K(i);
   A_21(i,i) = -K(i);
end
A_22 = zeros(N); % inititalize matrix to all zeros
for i=2:N
   A_22(i,i) = -3*K(i);
end
A = [A_11 A_12; A_21 A_22];

A = get_A_3seconds_rule(K);
B = zeros(2*N,1);
B(N+1)=1; 

% Set initial states
% first car starts at position zero, the rest have a random distance to te
% following car with standard deviation 15m and mean 70m 
d0 = 100; % initial_average_distance 
d0std = 20; % initial distance standard deviation 
initial_positions = zeros(N,1);
for i=2:N
    initial_positions(i) = initial_positions(i-1) - d0 + d0std*randn;
end

v0 = 10; % initial average velocity in m/s
v0std = 5; % initial velocities standard deviation
initial_velocities = v0 + v0std*randn(N,1);

x0 = [initial_positions ; initial_velocities]; % initial state



Tend = 60*10; % 2 minutes
h = 0.1; % Time step
t = (0:h:Tend)'; % time column vector
Ns = length(t); % Number of samples

u = 0; % first car keeps constant velocity
U = 2*sin(0.05*2*pi*t); % first car sinusoidal acceleration and velocity

X = zeros(Ns,2*N); % Matrix to store reslts of simulation
X(1,:) = x0'; % initial state
for i=2:Ns
   xprev = X(i-1,:)'; % x previous iteration
   x = xprev + h*(A*xprev+B*U(i)); % Forward Euler method
   X(i,:) = x'; % store result in big matrix X, each row contains one time sample
end

figure(1)
subplot(2,1,1)
plot(t,X(:,1:N),'.')
grid on
xlabel('time [s]')
ylabel('position [m]')
subplot(2,1,2)
plot(t,3600/1000*X(:,N+1:end),'.')
grid on
xlabel('time [s]')
ylabel('velocity [km/h]')


animation(X)




