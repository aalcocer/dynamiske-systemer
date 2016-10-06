function A = get_A_3seconds_rule(K)
% returns system matrix A for traffic model when using the 3 seconds
% distance rule

N = size(K,1);
% Determine system matrix 
% Determine system matrix 
A_11 = zeros(N);
A_12 = eye(N);
A_21 = zeros(N); % inititalize matrix to all zeros
for i=2:N
   A_21(i,i-1) = K(i);
   A_21(i,i) = -K(i);
end
A_22 = zeros(N); % inititalize matrix to all zeros
for i=2:N
   A_22(i,i) = -3*K(i);
end
A = [A_11 A_12; A_21 A_22];

A = [A_11 A_12; A_21 A_22];

