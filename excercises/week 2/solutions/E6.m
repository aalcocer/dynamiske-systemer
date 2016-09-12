close all
clear all


%t = linspace(0,10,100)';
h = 5 % sample time in seconds
t = (0:h:20)';

F = 18000;
b = 250;
m = 2400;

v = F/b*(1-exp(-b/m*t));


% Euler algorithm
N = length(t); % number of samples
X = zeros(N,2); % matrix to store solution. Each row contains the position and velocity
x = [0 0]'; % initital state, zero position and velocity
xprev = x; %  
X(1,:)=x'; % store initial position and velocity in first row
for i=2:N
    h = t(i)-t(i-1); % time step
    % h is constant in this problem but in other problems it may not be
    x = xprev + h*f2(xprev,m,b,F); %
    X(i,:) = x'; % stores x
    xprev = x;
end

figure(2)
subplot(2,1,1)
plot(t,X(:,2)*3600/1000,'b.-','DisplayName','Forward Euler')
hold on
plot(t,v*3600/1000,'k.-','DisplayName','Exact solution')
hold off
xlabel('time [s]')
ylabel('velocity [km/h]')
grid on
legend(gca,'Show')
subplot(2,1,2)
plot(t,(v-X(:,2))*3600/1000,'b.-','DisplayName','Exact-Euler Error')
xlabel('time [s]')
ylabel('velocity error [km/h]')
grid on
legend(gca,'Show')




