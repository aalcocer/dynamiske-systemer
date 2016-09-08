close all 
clear all



x = linspace(-20,20,100);


y = 2*x.^3-x.^2+x-1; % note the dot '.^' which meas that 
% the power operation is applied to all of the elements of the vector.

figure(1)
plot(x,y,'bo-')
grid on
xlabel('x')
ylabel('y(x)')
legend('y(x)=2*x^3-x^2+x-1')
title('A third order polynomial')

