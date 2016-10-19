

[KP,KV] = meshgrid(-5:.1:5); % creates

N = size(KP,1);

E = zeros(N,N);
Ei = zeros(N,N);

for i=1:N
    for j=1:N
        kp = KP(i,j);
        kv = KV(i,j);
        A = [0 0 1 0;
            0 0 0 1;
            -kp 0 -kv 0;
            0 -kp 0  -kv];
        e  = eig(A); % determine eigenvalues, it is a 4x1 vector with complex elements
        er = max(real(e)); % determines maximum real part. If positive then system unstable
        E(i,j) = er; % store er
        Ei(i,j) = max(abs(imag(e))); % maximum absolute value of comple part
    end
end

figure(1)
%surf(KP,KV,E)
mesh(KP,KV,E)
grid on

figure(2)
clf
%contour(KP,KV,E)
hold on
v = (-3:0.5:3);
contourf(KP,KV,E,v,'ShowText','on')
%contour(KP,KV,E,v,'LineWidth',2)
colorbar
grid on
xlabel('Kp')
ylabel('Kv')
title('Max real part')


figure(3)
clf
%contour(KP,KV,Ei)
hold on
v = (0:0.5:3);
contourf(KP,KV,Ei,v,'ShowText','on')
colorbar
grid on
xlabel('Kp')
ylabel('Kv')
title('Max imaginary part')





