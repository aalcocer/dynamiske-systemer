close all
clear all

x = randn(100,1);

figure(1)
plot(x,'.-r')
grid on
xlabel('sample k')
ylabel('x[k]')
legend('x[k]')

% Another way of creating vector x is using a for loop
% this is less efficient that the previous solution but gives same result

N = 100; % number of samples
x2 = zeros(N,1); % initialize, creates a vector of zeros and dimension Nx1
for i=1:N
    x2(i) = randn; % randn when called without arguments returns a scalar random number with normal distribution and zero mean
end

figure(2)
plot(x,'.-r')
hold on
plot(x2,'.-g')
hold off
grid on
xlabel('sample k')
ylabel('x[k]')
legend('x[k]','x2[k]')

% Note that the vectors are different, each time randn is called it returns
% a random number. It is possible to force matlab to use the same random
% numbers by setting the state of the internal random number generator:

s = rng; % saves state of random number generator in variable s
x = randn(100,1);
rng(s); % sets the random number generator state to s, 
x2 = zeros(100,1); % initialize, creates a vector of zeros and dimension 100x1
for i=1:100
    x2(i) = randn; % randn when called without arguments returns a scalar random number with normal distribution and zero mean
end

figure(3)
plot(x,'-b')
hold on
plot(x2,'og')
hold off
grid on
xlabel('sample k')
ylabel('x[k]')
legend('x[k]','x2[k]')
% Note that now x and x2 are exactly the same


% Experiment with different markers and colors
help plot
% you will see all valid colors, markers, and linestyles

% This is an exmaple of what you can do with matlab
mrkr = {'b-' 'g:' 'r.-' 'co-' 'yx-' 'ks-' 'b--' 'k:'}; % Defines a cell array which contains the different marker types
figure(4)
for i= 1:length(mrkr) % for loop times the length of the mrkr array
    hold on % so that plots are shown all together
    legendstr = sprintf('marker = %s',mrkr{i}); % creates a string type variable to be used in the legend
    plot(rand(10,1),mrkr{i},'DisplayName',legendstr)
    % this is to show that you can use the marker style as a variable, also
    % the legend of each plot can be given as an argument after the
    % 'DisplayName' property.
    % 
end
grid on
legend(gca,'show')









