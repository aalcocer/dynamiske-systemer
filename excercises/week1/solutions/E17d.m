close all
clear all


% question a

h = 0.1; % sampling time in seconds
t = (0:h:10)'; % time vector, column
N = length(t); % Number of samples
w = 2; % this was missing in excercise
s = 0.1;
y = 2*sin(w*t+1)+s*randn(N,1);

figure(1)
plot(t,y,'.-')
grid on
xlabel('time [s]')
ylabel('y(t)')
legend('y(t)')

% question b
% Using a table of derivatives we can find that if
% y = 2*sin(w*t+1)
% then
% ydot = 2*w*cos(w*t+1)

ydot = 2*w*cos(w*t+1);

figure(2)
plot(t,ydot,'.-')
grid on
xlabel('time [s]')
ylabel('ydot(t)')
legend('dy(t)/dt')

% question c, excersice has typo and shows a instead
ydotest = zeros(N-1,1); % initialize vector. 

for i=1:N-1
    ydotest(i)=(y(i+1)-y(i))/h;
end

figure(3)
plot(t,ydot,'b.-')
hold on
plot(t(2:end),ydotest,'k.-')
hold off
grid on
xlabel('time [s]')
ylabel('ydot(t)')
legend('dy(t)/dt','Dirty derivative estimate')







