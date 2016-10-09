
z = linspace(0,1,100)'; % vector of damping rations

P = 100*exp(-z*pi./sqrt(1-z.^2));

figure(1)
plot(z,P,'.-','LineWidth',3)
grid on
xlabel('Damping ratio \zeta')
ylabel('Percentage Overshoot [%]')