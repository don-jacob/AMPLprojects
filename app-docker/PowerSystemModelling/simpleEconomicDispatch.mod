set generators; #all the generators in the system.

param a {generators} > 0;
param b {generators} >= 0;
param c {generators};
param Pmin {generators} >= 0;
param Pmax {generators} >= 0;
param load;

var X {p in generators} >= Pmin[p], <= Pmax[p];

minimize genMW: sum {p in generators} (a[p] * X[p] * X[p] + b[p] * X[p] + c[p]);

subject to power_balance: sum {p in generators} X[p] = load;

###Explanations....

#set Products;

#param tonsPerHour {Products} > 0; #tons produced per hour.
#param maxHours {Stage} >= 0;#hours available in week for each stage in the production cycle. 
#There are 2 stages in this production model. 
#param dollarProfitPerTon {Products}; #profit per ton.
#param maxTons {Products} >= 0; #upper bound limit on tons sold in a week.
#param minTons {Products} >= 0; #lower bound limit on tons sold in a week.

#var X {p in Products} >= 0, <= maxTons[p]; #max tons produced.
#bounds for variables are placed during parameter declaration. 

#maximize Total_Profit: sum {p in Products} dollarProfitPerTon[p] * X[p];
#Objective: total profits from all products

#subject to Time: sum {p in Products} (1/tonsPerHour[p]) * X[p] <= maxHours;
#Constraint: total hours consumed across all products 
#should not exceed hours available. 