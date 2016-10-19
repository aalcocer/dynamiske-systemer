
N = 100; % number of points
w = linspace(0,10,N); % equally spaced frequencies
G = zeros(N,1); % vector to store gain
for i=1:N
    s = w(i)*j; % 
    H = 2/(s^2+s+2); % Evaluate H(jw)
    G(i)=abs(H); % Absolute value of complex number
end
figure(1)
plot(w,G)
grid on
xlabel('Frequency w[rads/s]')
ylabel('System gain')


N = 100; % number of points
w = linspace(0,10,N); % equally spaced frequencies
G = zeros(N,1); % vector to store gain
P = zeros(N,1); % vector to store phase
for i=1:N
    s = w(i)*j; % 
    H = 2/(s^2+s+2); % Evaluate H(jw)
    G(i) = abs(H); % Absolute value of complex number
    P(i) = angle(H);
end
figure(2)
subplot(2,1,1)
plot(w,G)
grid on
ylabel('System gain')
subplot(2,1,2)
plot(w,180/pi*P)
grid on
xlabel('Frequency w[rads/s]')
ylabel('Phase [deg]')


