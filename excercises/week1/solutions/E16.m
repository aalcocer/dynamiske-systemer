close all
clear all

N = 100; % number of points
X = zeros(N,3); % initialize matrix which will contain all the points x
fX = zeros(N,3); % initialize matrix which will contain all the points f(x)
s=2; % standard deviation
for i=1:N
    x= s*randn(3,1); % generate a 3x1 random vector, a point in R^3
    fx = fE15(x); % apply unit sphere map to x
    X(i,:) = x'; % store value of x as a row of matrix X 
    fX(i,:)= fx'; % store value of f(x) as a row of matrix fX 
end
% 

figure(1)
plot3(X(:,1),X(:,2),X(:,3),'b.')
hold on
plot3(fX(:,1),fX(:,2),fX(:,3),'y.')
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')

