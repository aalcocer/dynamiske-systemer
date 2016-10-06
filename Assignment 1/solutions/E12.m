%  E12 
close all
clear all


b = 0.5; % damping in N/(m/s)
m = 1; % mass in kg
k = 1; % spring constant in N/m12
F = 5; % Input force in Newtons

model_name = 'mass_spring_damper'; % string with model name

sim(model_name); % this simulates the model programatically and returns a variable logsout in workspace
% Assuming that you have configured the modelto do so by rightclicking the
% signals and logging them to workspace in "Simulation data inspector
% button"

t = logsout.getElement('x').Values.Time; 
x = logsout.getElement('x').Values.Data;
xdot = logsout.getElement('xdot').Values.Data;
xddot = logsout.getElement('xddot').Values.Data;

titlestr = sprintf('Mass-spring-damper system with F=%0.1f, m=%0.1f, b=%0.1f, k=%0.1f',F,m,b,k);
figure(1)
subplot(3,1,1)
%plot(logsout.getElement('x').Values,'.-')
plot(t,x,'.-')
ylabel('x [m]')
grid on
title(titlestr)
subplot(3,1,2)
plot(t,xdot,'.-')
ylabel('v [m/s]')
grid on
subplot(3,1,3)
plot(t,xddot,'.-')
ylabel('a [m/s^2]')
xlabel('Time [s]')
grid on

% Compute potential and kinetic energy of system
Ep = 1/2*k*x.^2; % potential energy
Ek = 1/2*m*xdot.^2; % potential energy
E = Ep+Ek; % total system energy 

figure(2)
plot(t,Ep,'b','DisplayName','Potential energy')
hold on
plot(t,Ek,'r','DisplayName','Kinetic energy')
plot(t,E,'g','DisplayName','Total energy')
hold off
grid on
legend('show')




