function xdot = f1(x,Ti,T0,P1,P2)


rho = 1000; %kg/m^3 density
V = 1; % m^3 volume
U = 500; % J/(s K) Heat transfer coefficient to environment 
C = 4200; %J/(kg K) specific heat capacity 

q = 0.2*1/1000 % volumetric flow rate in m^3/s (SI units)
% q  = 0.2 l/s = 0.2 l/s * 1/1000 m^3/l 
qm = q*rho; % kg/s mass flow rate (SI units for mass flow rate) 
% qm = 0.2 kg/s 


a = -(qm*C+U)/(C*rho*V);
b = qm/(rho*V);
c = U/(C*rho*V);
d = 1/(C*rho*V);


u = [Ti T0 P1 P2]';
A = [a 0;a b];
B = [b c d 0; 0 c 0 d];

xdot = A*x+B*u;


