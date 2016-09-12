close all
clear all


tspan = linspace(0,50,100);

x0 = [0 0]';

[t,x] = ode45(@f1 ,tspan, x0);


figure(2)
plot(t,x(:,2)*3600/1000,'.-')
xlabel('time [s]')
ylabel('velocity [km/h]')
grid on

