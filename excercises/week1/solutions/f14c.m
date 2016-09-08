function y = f14c(x)

y = zeros(3,1); % initialize output to proper dimensions, 
% output is  avector of size 3x1

y = [x; x^2; x^2+1-1/x];
