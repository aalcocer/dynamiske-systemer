
t = linspace(0,10,100)';

y = 3/5*(1-exp(-5*t));

figure(1)
plot(t,y,'.-','LineWidth',3)
grid on
ylabel('y(t)')
xlabel('t[s]')
legend('y(t)=3/5*(1-e^{-5t})')
