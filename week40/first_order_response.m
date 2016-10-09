% impulse response
close all
clear all

tau = 1;
a = 1/tau;
N=500;
t = linspace(0,10,N)';
y = exp(-a*t);

%y = [zeros(N,1);y];
%t = [-t;t];

figure(1)
plot(t/tau,y,'k-','LineWidth',2)
grid on
ylabel('y(t)')
xlabel('t/\tau')
legend('y(t)=e^{-t/\tau}')
fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',16)


figure(2)
plot(t/tau,1-y,'k-','LineWidth',2)
grid on
ylabel('y(t)')
xlabel('t/\tau')
legend('y(t)=1-e^{-t/\tau}')
fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',16)