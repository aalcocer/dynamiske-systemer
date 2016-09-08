function y = f15(x)

y = 1/sqrt(x'*x)*x; 

% 
% % Alternative and much less efficient solution
% % Note alternatively, but not as efficient, this can be written as a for
% % loop
% n = length(x);
% aux=0;
% for i=1:n
%     aux = aux + x(i)^2;
% end
% z = sqrt(aux); % this computes the length of vector x
% % note it is much better to have written z = sqrt(x'*x);
% % or use the built-in matlab function z = norm(x);
% y = zeros(n,1); % initialize output vector with right dimensions
% for i=1:n
%     y(i)=x(i)/z;
% end
% % Note that instead of one simple line of code, the alternative solution
% uses 2 for loops, three intermediate local variables adn several lines of
% code. Try always to think if there are simpler ways to implementwhat you
% do in matlab by using vectorized operations instead of for loops.
% 










