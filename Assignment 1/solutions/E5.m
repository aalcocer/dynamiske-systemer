% Exercise E5

% This is one possible solution

close all
clear all

Ti = 15+273; % inlet temperature in K
To = 50+273; % environment temperature in K
T10 = 20+273; % tank 1 initial temperature in K
T20 = 20+273; % tank 2 initial temperature in K

%P1 = 500; % heating power tank 1 in Watts
%P2 = 300; % heating power tank 2 in Watts
P1 = 500; % heating power tank 1 in Watts
P2 = 300; % heating power tank 2 in Watts


x0 = [T10; T20]; % initial state is 2x1

% Plot influence of P1 keeping other parameters fixed
P1 = [0 100 1000 5000]; % vector of test values for P1
figure(1)
clf % clears figure content if it was opened 
for i=1:length(P1) % loop over the different values of P1
    u = [Ti To P1(i) P2]'; % create input vector is 4x1
    [t,X] = tank_temp_euler(x0,u); % returns solution using euler method
    % Now X contains the solution, T1=X(:,1) is the first column and contains
    % the temperature of tank 1. T2=X(:,2) is the second column of X and
    % contains the temperature of tank 2.
    T1 = X(:,1)-273; % extract first column of X, temperature of tank 1 in degres Celsius
    T2 = X(:,2)-273; % extract second column of X, temperature of tank 2 in degrees Celsius
    str1 = sprintf('T1 with P1 = %.0f',P1(i));
    str2 = sprintf('T2 with P1 = %.0f',P1(i));
    subplot(2,1,1)
    hold on
    plot(t,T1,'.-','DisplayName',str1)
    subplot(2,1,2)
    hold on
    plot(t,T2,'.-','DisplayName',str2)
end
subplot(2,1,1)
grid on
ylabel('Temperature Tank 1 [C]')
legend('show')
titlestr= sprintf('P2=%0.f, Ti=%0.f,To=%0.f', P2,Ti-273,To-273);
title(titlestr)
subplot(2,1,2)
grid on
xlabel('Time [s]')
ylabel('Temperature Tank 2 [C]')
legend('show')


   

% Plot influence of Ti keeping other parameters fixed
P1 = 500; % heating power tank 1 in Watts
Ti = [0 10 20 50]+273; %
figure(2)
clf % clears figure content if it was opened 
for i=1:length(Ti)
    u = [Ti(i) To P1 P2]'; % create input vector is 4x1
    [t,X] = tank_temp_euler(x0,u); % returns solution using euler method
    % Now X contains the solution, T1=X(:,1) is the first column and contains
    % the temperature of tank 1. T2=X(:,2) is the second column of X and
    % contains the temperature of tank 2.
    T1 = X(:,1)-273; % extract first column of X, temperature of tank 1 in degres Celsius
    T2 = X(:,2)-273; % extract second column of X, temperature of tank 2 in degrees Celsius
    str1 = sprintf('T1 with Ti = %.0f',Ti(i));
    str2 = sprintf('T2 with Ti = %.0f',Ti(i));
    subplot(2,1,1)
    hold on
    plot(t,T1,'.-','DisplayName',str1)
    subplot(2,1,2)
    hold on
    plot(t,T2,'.-','DisplayName',str2)
end
subplot(2,1,1)
grid on
ylabel('Temperature Tank 1 [C]')
legend('show')
titlestr= sprintf('P1=%0.f,P2=%0.f,To=%0.f', P1,P2,To-273);
title(titlestr)
subplot(2,1,2)
grid on
xlabel('Time [s]')
ylabel('Temperature Tank 2 [C]')
legend('show')


