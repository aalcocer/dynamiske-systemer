close all
clear all

x = randn(100,1);
y = 2*randn(100,1)+5; % the +5 adds 5 to all elements of vector


figure(1)
plot(x,'.-r')
hold on
plot(y,'o-k')
grid on
xlabel('sample k')
ylabel('x[k]')
legend('x[k]','y[k]')

% You can plot a histogram of the vectors like this
figure(2)
histogram(x)
hold on
histogram(y)
hold off
grid on
legend('x','y')

z = 5*randn(100,1)+40; % 
figure(3)
subplot(2,1,1)
plot(x,'.-r')
hold on
plot(y,'o-k')
plot(z,'s:b')
grid on
xlabel('sample k')
ylabel('value')
legend('x[k]','y[k]','z[k]')
subplot(2,1,2)
histogram(x)
hold on
histogram(y)
histogram(z)
hold off
grid on
legend('x','y','z')
xlabel('value')
ylabel('value count')


