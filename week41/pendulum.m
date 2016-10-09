% inverted pendulum
% pendulum linearization around unstable equilibrium
s = sym('s');
I = sym('I');
A = [0 1;
     0 0];
B = [0;1/I ]; % inertia =1
C = [1 0];
H = C*inv(s*eye(2)-A)*B;