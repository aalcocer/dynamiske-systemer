
close all
clear all

t = linspace(0,10,100)'; % Creates 100 equally spaced points between 0 and 10

t2 = (0:01:10)';

w = 2;
y = 2*sin(w*t+1); % note that w and 1 are scalars while t is a vector. 
% MATLAB decides how to treat this. 
% Scalar times a vector multiplies all elements,
% Adding a scalar to a vector adds the scalar to all of its elements.

figure(1)
plot(t,y,'ko-')
grid on
xlabel('t [s]')
ylabel('y(t)')

% alternatively one cold have used a for loop but that is much less
% efficient

N = length(t);
y = zeros(N,1);% initializes y as a column vector of proper dimension. 
% This is not necessary but it is a good programming practice.
for i=1:N
    y(i)=2*sin(w*t(i)+1);
end

% Note that if the variable is not initialized MATLAB treats it as a row
% vector, and for large vectors this is very inefficient and time consuming
% Bad example, not very good matlab programming:
for i=1:N
    z(i)=2*sin(w*t(i)+1); % Note that z has not been defined previously
    % This does not generate an error but takes much longer to compute specially if dimension is large.
    % z is now a row vector
end


W = [5 2 1 0.5 ]; % vector of omegas
H = [0.005 0.1 0.5 1]; % vector of sampling periods
figure(2)
hold on
for i=1:length(W)
    t = (0:H(i):10)'; % cretaes t vector with sampling time H(i)
    y = 2*sin(W(i)*t+1);
    legendstr = sprintf('w=%0.3g; h=%0.3g',W(i),H(i));
    plot(t,y,'o-','DisplayName',legendstr)
end
grid on
legend(gca,'show')
xlabel('t [s]')
ylabel('y(t)')







