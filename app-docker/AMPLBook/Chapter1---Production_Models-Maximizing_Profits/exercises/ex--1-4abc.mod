set cars;

set constraint_names;

 

param constraint_list {cars, constraint_names} > 0;

param constraint_limits {constraint_names} > 0;

 

param profit_per_car {cars} >= 0;

param min_orders_per_car {cars} >= 0;

 

var X {i in cars} >= min_orders_per_car[i];

 

maximize total_profit: sum {i in cars} profit_per_car[i] * X[i];

 

subject to constraints {c in constraint_names}: sum {i in cars} constraint_list[i,c] * X[i] <= constraint_limits[c];
