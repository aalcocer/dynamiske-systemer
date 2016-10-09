function z = overshoot_to_damping(PO)
% Computes damping ratio for a given percentage overshoot 
z = sqrt(log(PO/100)^2/(pi^2+log(PO/100)^2))
