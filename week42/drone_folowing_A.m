

kp = 1;
kv = 1;

A = [0 0 1 0;
    0 0 0 1;
    -kp 0 -kv 0;
    0 -kp 0 -kv];

eig(A)


N = 100;
K = linspace(-5,5,N);
E = zeros(N,4);

for i=1:N
    kp = 1;
    kv = K(i);
    A = [0 0 1 0;
        0 0 0 1;
        -kp 0 -kv 0;
        0 -kp 0  -kv];
    e= eig(A); % determine eigenvalues, it is a 4x1 vector with complex elements
    E(i,:) = e'; % store in row of E, E has complex entries
end

figure(1)
clf
plot(K,real(E),'o-','DisplayName','Real part')
hold on
plot(K,imag(E),'.-','DisplayName','Imaginary part')
hold off
grid on
xlabel('Proportional gain k')
ylabel('Eigenvalues of sysem matrix A')
legend(gca,'show')





