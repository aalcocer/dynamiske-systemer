% Nomoto 1rst order model model parameters
K = -0.2; % 
T = 16.4;


step.time = 1;
step.value = 10; % step input 10 degree change in heading reference


   
model_name = 'nomoto_1st';

set_param(model_name, 'StopTime', '30','MaxStep','1e-2');
sim(model_name);

h = simout.get.Data(:,1);
r = simout.get.Data(:,2);
t = simout.get.Time;


figure(1)
clf
subplot(2,1,1)
plot(t,r,'-','LineWidth',2)
grid on
legend('r(t)')
ylabel('Rudder angle [deg]')
subplot(2,1,2)
plot(t,h,'-','LineWidth',2)
grid on
legend('\psi(t)')
ylabel('Heading angle [deg]')


