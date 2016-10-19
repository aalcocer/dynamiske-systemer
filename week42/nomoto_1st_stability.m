% Nomoto 1rst order model model parameters
K = -0.2; % 
T = 16.4;

% closed loop system

N = 100;
Kp = linspace(-10,10,N);
E = zeros(N,2);
for i=1:N
    D = [T 1 Kp(i)*K];
    e = roots(D);
    E(i,:)=e';
end

figure(1)
clf
plot(Kp,real(E),'.')
grid on
xlabel('Proportional gain K_p')
ylabel('Real part of poles')






   


