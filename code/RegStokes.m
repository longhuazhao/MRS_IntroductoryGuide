function [A] = RegStokes(x,y,epsilon)

% This function should take x,y, and epsilon and
% output the Regularized Stokeslet matrix A from Eq 12

%% Input 
% x is a 3 x 1 vector of the force location
% y is a 3 x 1 vector of the observation point
% epsilon is the blob function parameter

%% Output
% A is the 3 x 3 matrix in Eq 6
r1=y(1)-x(1);
r2=
r3=

r=
r_eps=

a11=
a12=
a13=
a21=
a22=
a23=
a31=
a32=
a33=


%%% Rewrite this part of the code
A = [a11,a12,a13; a21, a22, a23; a31,a32,a33]



end