function A = get_A_middle_rule(K)
% returns system matrix A for traffic model when using the middle
% distance rule between forward and behid cars

N = size(K,1); % number of cars

% Determine system matrix 
A_11 = zeros(N);
A_12 = eye(N);

A_21 = zeros(N); % inititalize matrix to all zeros
for i=2:N-1
   A_21(i,i-1) = K(i);
   A_21(i,i) = -2*K(i);
   A_21(i,i+1) = K(i);   
end
A_21(N,N-1) = K(N);
A_21(N,N) = -K(N);


A_22 = zeros(N); % inititalize matrix to all zeros
A_22(N,N) = -3*K(N);

A = [A_11 A_12; A_21 A_22];

