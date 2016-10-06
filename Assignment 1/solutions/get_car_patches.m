function [XT,YT] = get_car_patches(x)
% generates patches to use in drawing car position from a state vector
% x = [positions ; velocities] and has dimension 2*N where N is the number of cars

N = length(x)/2; % number of cars


L = 3; % car length
H = 1.7; % car height
s = 30;
L = L*4;
H = H*4;

X = [0 L L L*.7 L*.45 0 0]'; % rectangle x-coordinates
Y = [0 0 H*.55 H*.6 H H 0]'; % rectangle y-coordinates
Nv = length(X); % number of vertices in patch


YT = repmat(Y,1,N); % repeat matrix Y Nv times, all cars vertical profile is the same

XT = zeros(Nv,N);

for i=1:N
    XT(:,i) = X + x(i);
end

