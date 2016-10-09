% second order system

wn = 1;
z = 0.4;
K = 2;
   
model_name = 'second_order_system';
set_param(model_name, 'StopTime', '30','MaxStep','1e-2');
sim(model_name);

figure(1)
plot(simout,'-','LineWidth',2)
grid on
legend('y(t)','u(t)')




