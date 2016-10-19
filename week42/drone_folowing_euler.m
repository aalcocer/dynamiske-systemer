clear all
close all


kp = 1;
%z = 1; % damping ratio
%kv = 2*sqrt(kp)/z;
kv = 1;


A = [0 0 1 0;
    0 0 0 1;
    -kp 0 -kv 0;
    0 -kp 0 -kv];

B = [0 0;
     0 0;
     kp 0;
     0 kp];


h = 0.1; % timestep in seconds. 
Tend = 50; % simulation end time in seconds
t = (0:h:Tend)'; % time vector
N = length(t); % number fo points


% Generate target trajectory
Pr = zeros(N,2); % vector contains [ xr yr] in each row
pr0 = [0;0]; % starts at zero position
Pr(1,:) = pr0';
for i=1:N-1
   vr =  [ 1 ; sin(2*pi/40*t(i))];% target velocity   
   Pr(i+1,:) = Pr(i,:) + h*vr';   
end

figure(1)
plot(Pr(:,1),Pr(:,2),'.-')
grid on
xlabel('target position x [m]')
ylabel('target position y [m]')
axis equal


p0 = 30*randn(2,1); % random initial dron position 30m standard deviation
v0 = [0;0]; % zero initial drone velocity
x0 = [p0;v0]; % initial state
X = zeros(N,4); % matrix to store result
% X has two columns and N rows. Each row correspons to a time sample.
% Column 1 contains T1, ad column 2 contains T2
X(1,:) = x0'; % store intial state in the first row
x = x0; 
for i=1:N-1
    u = Pr(i,:)'; % target position at time t(i)
    xdot = A*x+B*u; % determine time derivative of state
    x = x + h*xdot; % forward Euler method
    X(i+1,:) = x'; % store state in the i'th row
end


figure(2)
clf
plot(Pr(:,1),Pr(:,2),'k.-','DisplayName','Target')
hold on
plot(X(:,1),X(:,2),'b.-','DisplayName','Drone')
grid on
xlabel('target position x [m]')
ylabel('target position y [m]')
legend(gca,'show')
axis equal


figure(3)
subplot(2,1,1)
plot(t,Pr(:,1),'k.-','DisplayName','Target')
hold on
plot(t,X(:,1),'b.-','DisplayName','Drone')
grid on
ylabel('x [m]')
legend(gca,'show')
subplot(2,1,2)
plot(t,Pr(:,2),'k.-','DisplayName','Target')
hold on
plot(t,X(:,2),'b.-','DisplayName','Drone')
grid on
ylabel('y [m]')
xlabel('Time [s]')
legend(gca,'show')

