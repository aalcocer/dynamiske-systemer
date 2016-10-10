% second order system

wn = 1; % natural frequency
z = 0.5; % damping ratio
K = 1; % gain
   
model_name = 'second_order_system';
set_param(model_name, 'StopTime', '30','MaxStep','1e-2');
sim(model_name);

figure(1)
plot(simout,'-','LineWidth',2)
grid on
legend('y(t)','u(t)')




