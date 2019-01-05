set Products; #number of products
set Stage; #number of stages in the production cycle for each product. 

param tonsPerHour {Products, Stage} > 0;
param maxHours {Stage} >= 0;
param dollarProfitPerTon {Products};
param maxTons {Products} >= 0;
param minTons {Products} >= 0;
param weight_limit >= 0;

var X {p in Products} >= minTons[p], <= maxTons[p];

#maximize Total_Profit: sum {p in Products} dollarProfitPerTon[p] * X[p];
maximize tons_produced: sum {p in Products} X[p];

subject to Time {s in Stage}: sum {p in Products} (1/tonsPerHour[p,s]) * X[p] <= maxHours[s];

subject to max_weight: sum {p in Products} X[p] <= weight_limit;

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