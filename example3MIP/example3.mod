param n;
param m;
set J := {1..n}; #set of decision variables
set I := {1..m}; #set of constraints

param C {J} >= 0; #objective function of coeffecients
param A {I,J} >= 0; #constraint  coefficients matrix
param B {I} >= 0;#rhs of the constraints

var X {J} >= 0 integer; #decision variables
#decision variables are by default assumed to be real numbers.
#the only difference between example2 and example3 is the declaration of integer here. 
#in the case of Mixed Integer Programming. You would only assign those variables as integer that are required to be integer.
#The remaining variables you would just not mention integer.
#If the variables are binary, then replace integer with binary.

minimize z: sum {j in J} C[j] * X[j];

#This works like a loop and will take care of all the constraints
s.t. Constraint {i in I}: 
	sum {j in J} A[i,j] * X[j] >= B[i]; 