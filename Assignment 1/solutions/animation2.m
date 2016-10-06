function animation2(X,Xm)
%close all
%clear all



%car_traffic_simulation;
N = size(X,2)/2; % number of cars
x = X(1,:)'; % state position and velocity
[XT,YT] = get_car_patches(x);
Ns = size(X,1); % number of samples


%figure(3)
subplot(2,1,1)
p1 = patch(XT,YT,0.3*[1 1 1]);
xlabel('Distance [m]')
%ylim([-100 100]);
axis equal
grid on
subplot(2,1,2)
p2 = patch(XT,YT,0.6*[1 1 1]);
xlabel('Distance [m]')
%ylim([-100 100]);
axis equal
grid on
for i=2:100:Ns
   x = X(i,:)';
   xm = Xm(i,:)';
   [XT,YT] = get_car_patches(x);
   [XTm,YTm] = get_car_patches(xm);
   p1.XData = XT;
   p1.YData = YT;
   p2.XData = XTm;
   p2.YData = YTm;
   drawnow
end


