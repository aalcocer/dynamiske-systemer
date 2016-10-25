% Computes trajectory of ExoMars orbiter approaching Mars
clear all
close all

% ----------------------------------------------------
% Define parameters and constants 
m = 4332; % Mass of ExoMars orbiter in kg
M = 6.39e23; % Mass of Mars in kg
G = 6.67e-11; % Gravitational constant N???(m/kg)2
rM = 3390e3; % Mars radius
% ----------------------------------------------------
% Try changing the values of k and Vs to try to get ExoMars vehicle
% Enter orbit around Mars
k = 100; % Direction pointing towards a point k_target*rM away from center of Mars
Vs = 1300; % initial speed in m/s
% ----------------------------------------------------
% Define initial position and velocity vectors
d = 20*rM; % initial distance to Mars, as a function the radius of Mars
p0 = [-d ; 0]; % initial Exomars orbiter position
ps = [0; k*rM]; % point towards which initial velocity vector is pointing
z = (ps-p0)/norm(ps-p0); % unitary vector pointing towards a point k*rM away from center of Mars
% z haslength 1
v0 = Vs*z; % initial velocity of vehicle.
x0 = [p0;v0]; % initial state
% ----------------------------------------------------
% Define Simulation parameters
Tend_days = 5; % simulation end time in days
Tend = Tend_days*24*3600; % simulation end time in seconds
N = 1e4; % number of samples
t = linspace(0,Tend,N);
% Select solver: uncomment the desired solver
%solver_type = 'ode45';
%solver_type = 'Symplectic_Euler';
solver_type = 'Velocity_Verlet';

switch solver_type
    case 'ode45'
        [t,x]=ode45(@ExoMars_der,tspan,x0);
    case 'Symplectic_Euler'
        % Symplectic Euler (semi-implicit) method
        % https://en.wikipedia.org/wiki/Semi-implicit_Euler_method
        x = zeros(N,4); % initialize solution matrix
        h = t(2)-t(1); % time step
        x(1,:) = x0';
        for i=1:N-1
            p = x(i,1:2)'; % position
            v = x(i,3:4)'; % velocity
            v = v + -h*G*M*p/norm(p)^3; % use previous position to determine velocity 
            p = p +h*v; % use velocity to determine next position
            x(i+1,:)=[p; v]';
        end
    case 'Velocity_Verlet'
        % Velocity Verlet algorithm https://en.wikipedia.org/wiki/Verlet_integration
        % Størmer's method
        % https://en.wikipedia.org/wiki/Carl_St%C3%B8rmer
        x = zeros(N,4);
        h = t(2)-t(1); % time step
        x(1,:) = x0';
        for i=1:N-1
            p = x(i,1:2)'; % position
            v = x(i,3:4)'; % velocity
            a = -G*M*p/norm(p)^3; % acceleration previous iteration
            pn = p +h*v + 1/2*a*h^2; % position next iteration
            an = -G*M*pn/norm(pn)^3; % acceleration next iteration
            vn = v + 1/2*h*(a + an); % velocity next iteration
            x(i+1,:)=[pn; vn]'; % store state position and velocity
        end % end for loop
end % end switch statement


af = 200; % number of animation frames
sf = round(N/af); % frame step
figure(1)
clf
px = plot(x(1,1),x(1,2),'.-')
grid on
hold on
pM = rectangle('Position',[-rM,-rM,2*rM,2*rM],...
    'Curvature',[1,1], 'FaceColor','r');
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
plot(1/24/3600*t,x(:,1:2),'.-')
grid on
ylabel('Position [m]')
legend('x','y')
subplot(2,1,2)
plot(1/24/3600*t,x(:,3:4),'.-')
grid on
xlabel('Time [days]')
ylabel('Velocity [m/s]')
legend('v_x','V_y')






