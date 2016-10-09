
A = [0 1 0;
    0 0 1;
    -1 2 -1];
e = eig(A)

k =1;
Ab = A-k*eye(3);
eb = eig(Ab)


A = [0 1 0;
    0 0 1;
    -1 2 -1];
k = linspace(-10,10,100);
N = length(k)
E = zeros(N,3);
for i=1:N
    Ab = A-k(i)*eye(3);
    eb = eig(Ab);
    E(i,:)=real(eb);  
end
figure(1)
clf
plot(k,E)
grid on
xlabel('k')
ylabel('Re(\lambda_i)')


