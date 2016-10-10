% exponential test

t = linspace(0,10,100)';
K = 1;
a = -1;

y = K*a*exp(-a*t);

figure(1)
clf
plot(t,y,'.-','LineWidth',2)
grid on
xlabel('time [s]')
ylabel('y(t)')




