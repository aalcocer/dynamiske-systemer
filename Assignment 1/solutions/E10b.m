% Exercise E10
% This is one possible solution

close all
clear all

b = 1; % damping in N/(m/s)
m = 1; % mass in kg
k = 1; % spring constant in N/m
F = 5; % Input force in Newtons

x0 = [1; 0]; % initial state is 2x1, contains initial position and initial velocity
Tend = 10;

h = [0.01 0.2 0.5 1]; % vector of time steps
Nh = length(h);
for i=1:Nh
    [t,X,a] = mass_spring_damper_euler_h(x0,h(i),Tend);
    T{i} = t;
    TX{i}=X;
    TA{i}=a;
end

titlestr = sprintf('Mass-spring-damper system with F=%0.1f, m=%0.1f, b=%0.1f, k=%0.1f',F,m,b,k);
figure(1)
clf
subplot(3,1,1)
hold on
for i=1:Nh
    str = sprintf('h=%.2f',h(i));
    plot(T{i},TX{i}(:,1),'-','LineWidth',1,'DisplayName',str)
end
legend('show')
ylabel('Position [m]')
grid on
title(titlestr)
subplot(3,1,2)
hold on
for i=1:Nh
    str = sprintf('h=%.2f',h(i));
    plot(T{i},TX{i}(:,2),'-','LineWidth',1,'DisplayName',str)
end
legend('show')
ylabel('Velocity [m/s]')
grid on
subplot(3,1,3)
hold on
for i=1:Nh
    str = sprintf('h=%.2f',h(i));
    plot(T{i},TA{i}(:,1),'-','LineWidth',1,'DisplayName',str)
end
legend('show')
ylabel('Acceleration [m/s^2]')
xlabel('Time [s]')
grid on

