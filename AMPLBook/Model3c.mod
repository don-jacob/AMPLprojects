set Products;

param tonsPerHour {Products} > 0;
param maxHours >= 0;
param dollarProfitPerTon {Products};
param maxTons {Products} >= 0;
param minTons {Products} >= 0;

var X {p in Products} >= minTons[p], <= maxTons[p];

maximize Total_Profit: sum {p in Products} dollarProfitPerTon[p] * X[p];

subject to Time: sum {p in Products} 1/tonsPerHour[p] * X[p] <= maxHours;

###Explanations....

#set Products;

#param tonsPerHour {Products} > 0; #tons produced per hour.
#param maxHours >= 0;              #hours available in week. 
#
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



