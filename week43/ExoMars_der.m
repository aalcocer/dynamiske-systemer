function xdot = ExoMars_der(t,x)
% computer time derivative of position and velocity of ExoMars vehicle 

m = 4332; % Mass of ExoMars orbiter in kg
M = 6.39e23; % Mass of Mars in kg
G = 6.67e-11; % Gravitational constant N?·?(m/kg)2
p = x(1:2);
v = x(3:4);

pdot = v;
vdot = -G*M*p/norm(p)^3;
xdot = [pdot; vdot];