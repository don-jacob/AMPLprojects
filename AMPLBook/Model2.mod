set P;

var X {j in P};

param b;
param a {j in P};
param c {j in P};
param u {j in P};

maximize Total_Profit: sum {j in P} c[j] * X[j];

subject to Time: sum {j in P} (1/a[j]) * X[j] <= b;
subject to Limit {j in P}: 0 <= X[j] <= u[j];

####Explainations.....

#contains the number of decision variables

#set P;

#different ways of parameter declaration.
#declares a parameter b
#for each j in P. {} indicate visting each element in set P.
#also lists a collection values. an individual value can be refered as a[j], c[j], u[j] etc.

#param b;
#param a {j in P};
#param c {j in P};
#param u {j in P};

#variable declaration. this would be all the decision variables.

#var X {j in P};

#objective cost function.
#objective function name is required by syntax.
#sum operator has lower precedence than "*".
#Therefore multiplication for each element in P is done and then summed.

#maximize Total_Profit: sum {j in P} c[j] * X[j];

#Time is the name of a constraint. This constraint says that a certain sum
#over the set P may not exceed the value of parameter b.

#subject to Time: sum {j in P} (1/a[j]) * X[j] <= b;

#Limit is a family of constraints one for each member j of P.
#Each variable in set P, X[j] is bounded by 0 and corresponding u[j]

#subject to Limit {j in P}: 0 <= X[j] <= u[j];
