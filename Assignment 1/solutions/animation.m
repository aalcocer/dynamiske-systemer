function animation(X)
%close all
%clear all



%car_traffic_simulation;
N = size(X,2)/2; % number of cars
x = X(1,:)'; % state position and velocity
[XT,YT] = get_car_patches(x);
Ns = size(X,1); % number of samples


figure(3)
p = patch(XT,YT,0.4*[1 1 1]);
xlabel('Distance [m]')
%ylim([-100 100]);
axis equal
grid on
for i=2:5:Ns
   x = X(i,:)';
   [XT,YT] = get_car_patches(x);
   p.XData = XT;
   p.YData = YT;
   drawnow
end


