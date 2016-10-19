% Nomoto 1rst order model model parameters
K = -0.2; % 
T = 16.4;

Kp = -2;

step.time = 1;
step.value = 10; % step input 10 degree change in heading reference


   
model_name = 'nomoto_1st_Kp';

set_param(model_name, 'StopTime', '100','MaxStep','1e-2');
sim(model_name);

% h = simout.get.Data(:,1);
% r = simout.get.Data(:,2);
% t = simout.get.Time;

r = logsout.getElement('rudder').Values.Data; % ruder command
t = logsout.getElement('rudder').Values.Time; % time
psiref = logsout.getElement('psiref').Values.Data; % reference heading
psi = logsout.getElement('psi').Values.Data; % actual heading



figure(1)
clf
subplot(2,1,1)
plot(t,r,'-','LineWidth',2)
grid on
legend('r(t)')
ylabel('Rudder angle [deg]')
subplot(2,1,2)
plot(t,psiref,'k-','LineWidth',2)
hold on
plot(t,psi,'b-','LineWidth',2)
grid on
legend('Heading reference','Heading')
ylabel('Heading angle [deg]')


