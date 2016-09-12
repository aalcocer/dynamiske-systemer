close all
clear all

N = 100;
Tend = 100;
t = linspace(0,Tend,N)';

F = 18000;
b = 250;
m = 2400;

v = zeros(N,1);
for i=1:N
    v(i) =  F/b*(1-exp(-b/m*t(i)));
end


figure(2)
plot(t,v*3600/1000,'.-')
xlabel('time [s]')
ylabel('velocity [km/h]')
grid on
