% Exercise E6

close all
clear all

% Parameters
rho = 1000; %kg/m^3 density
V = 1; % m^3 volume
U = 500; % J/(s K) Heat transfer coefficient to environment 
c = 4200; %J/(kg K) specific heat capacity 
qv = 0.2*1/1000; % volumetric flow rate in m^3/s (SI units)
% qv  = 0.2 l/s = 0.2 l/s * 1/1000 m^3/l 
q = qv*rho; % kg/s mass flow rate (SI units for mass flow rate) 
% For this exercise q = 0.2 kg/s has the same value of qv in l/s qv= 0.2 l/s


% constants
a = -(q*c+U)/(c*rho*V);
b = q/(rho*V);
c0 = U/(c*rho*V);
d = 1/(c*rho*V);

Ti = 15+273; % inlet temperature in K
To = 50+273; % environment temperature in K
T10 = 20+273; % tank 1 initial temperature in K
T20 = 20+273; % tank 2 initial temperature in K

%P1 = 500; % heating power tank 1 in Watts
%P2 = 300; % heating power tank 2 in Watts
P1 = 500; % heating power tank 1 in Watts
P2 = 300; % heating power tank 2 in Watts


x0 = [T10; T20]; % initial state is 2x1

u = [Ti To P1 P2]'; % input vector is 4x1
A = [a 0;
     b a]; % A matrix is 2x2
B = [b c0 d 0; 
     0 c0 0 d]; % B matrix is 2x4
 
h = 50; % timestep in seconds. This is a simple first order linear system with very slow dynamics, therefore it is possible to use a large time step   
Tend = 3e4; % simulation end time in seconds
t = (0:h:Tend)'; % time vector
N = length(t); % number fo points

% X has two columns and N rows. Each row correspons to a time sample.
% Column 1 contains T1, ad column 2 contains T2
[t,X] = ode45(@(t,x) A*x+B*u, t,x0);


% Now X contains the solution, T1=X(:,1) is the first column and contains
% the temperature of tank 1. T2=X(:,2) is the second column of X and
% contains the temperature of tank 2.

T1 = X(:,1)-273; % extract first column of X, temperature of tank 1 in degres Celsius
T2 = X(:,2)-273; % extract second column of X, temperature of tank 2 in degrees Celsius
figure(1)
plot(t,T1,'b','LineWidth',2)
hold on
plot(t,T2,'k','LineWidth',2)
hold off
grid on
xlabel('Time [s]')
ylabel('Temperature [°C]')
legend('T_1','T_2')


