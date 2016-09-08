function y = f14d(x)

n = length(x);

aux = 0;
for i=1:n
    aux = aux + x(i)^2;
end
y = sqrt(aux);