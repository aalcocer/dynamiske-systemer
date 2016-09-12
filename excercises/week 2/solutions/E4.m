close all
clear all

N = 100;
t = linspace(0,10,N)';

F = 100;
b = 2;
m = 1;

v = zeros(N,1);
for i=1:N
    v(i) =  F/b*(1-exp(-b/m*t(i)));
end

v2 = F/b*(1-exp(-b/m*t));



figure(1)
plot(t,v,'.-')
xlabel('time [s]')
ylabel('velocity [m/s]')
grid on

figure(2)
plot(t,v*3600/1000,'.-')
xlabel('time [s]')
ylabel('velocity [km/h]')
grid on

figure(3)
hold on
for F=[1 1.2 1.5 2 3 5]
    v = F/b*(1-exp(-b/m*t));
    str = sprintf('F/b= %0.3g; b/m = %0.3g',F/b,b/m); % creates string to be used in legend
    plot(t,v,'.-','DisplayName',str)
end
xlabel('time [s]')
ylabel('velocity [m/s]')
grid on
legend(gca,'Show')

F = 1;
b = 1;
figure(4)
hold on
for m=[1 1.2 1.5 2 3 5]
    v = F/b*(1-exp(-b/m*t));
    str = sprintf('F/b= %0.3g; b/m = %0.3g',F/b,b/m); % creates string to be used in legend
    plot(t,v,'.-','DisplayName',str)
end
xlabel('time [s]')
ylabel('velocity [m/s]')
grid on
legend(gca,'Show')