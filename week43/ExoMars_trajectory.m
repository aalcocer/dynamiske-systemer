% Computes trajectory of ExoMars orbiter approaching Mars

m = 4332; % Mass of ExoMars orbiter in kg
M = 6.39e23; % Mass of Mars in kg
G = 6.67e-11; % Gravitational constant N?·?(m/kg)2
rM = 3390e3; % Mars radius
d = 50*rM; % initial distance to Mars, as a function the radius of Mars
p0 = [-d ; 0]; % initial Exomars orbiter position 

k = 10; % Direction pointing towards a point k_target*rM away from center of Mars
Vs = 1000; % initial speed in m/s
%Vs = 26000; % initial speed in m/s


% Speed 26500m/s. Direction pointing towards a point k*rM away from center of Mars
ps = [0; k*rM]
z = (ps-p0)/norm(ps-p0); % unitary vector pointing towards a point k*rM away from center of Mars
% z haslength 1
v0 = Vs*z; % initial velocity of vehicle. 

Tend = 1e6; % simulation time end
N = 1e4; % number of samples
tspan = linspace(0,Tend,N);
x0 = [p0;v0]; % initial state

%[t,x]=ode45(@(t,x)[x(3:4) ; -G*M*x(1:2)/norm(x(1:2))^3]  ,tspan,x0);
[t,x]=ode45(@ExoMars_der,tspan,x0);



af = 200; % number of animation frames
sf = round(N/af); % frame step
figure(1)
clf
px = plot(x(1,1),x(1,2),'.-')
grid on
hold on
pM = rectangle('Position',[-rM,-rM,2*rM,2*rM],...
  'Curvature',[1,1], 'FaceColor','r')
axis square;
axis equal
xlabel('x [m]')
ylabel('y [m]')
for i=1:sf:N 
    px.XData = x(1:i,1);
    px.YData = x(1:i,2);
    drawnow
end

figure(2)
clf
subplot(2,1,1)
plot(1/3600*t,x(:,1:2),'.-')
grid on
ylabel('Position [m]')
legend('x','y')
subplot(2,1,2)
plot(1/3600*t,x(:,3:4),'.-')
grid on
xlabel('Time [hours]')
ylabel('Velocity [m/s]')
legend('v_x','V_y')






