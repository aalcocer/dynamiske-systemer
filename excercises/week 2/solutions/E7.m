close all
clear all


tspan = linspace(0,50,100);

x0 = [0 0]';
m = 2400;
b = 240;
F = 18000;

%[t,x] = ode45(@(t,x) f2(x,m,b,F),tspan, x0); % f2 acccepts m,b,F as
% arguments
[t,x] = ode45(@f1,tspan, x0); % f1 has m,b,F as constants defined inside function


v = F/b*(1-exp(-b/m*t));


figure(2)
subplot(2,1,1)
plot(t,x(:,2)*3600/1000,'b.-','DisplayName','ODE45')
hold on
plot(t,v*3600/1000,'k.-','DisplayName','Exact solution')
hold off
xlabel('time [s]')
ylabel('velocity [km/h]')
grid on
legend(gca,'Show')
subplot(2,1,2)
plot(t,(v-x(:,2))*3600/1000,'b.-','DisplayName','Exact-ODE45 Error')
xlabel('time [s]')
ylabel('velocity error [km/h]')
grid on
legend(gca,'Show')

