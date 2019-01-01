set advertising_platform; #contains list of different advertising platforms - TV, magazines etc.
set constraint_names;

param constraint_list {advertising_platform, constraint_names} > 0;
param constraint_limits {constraint_names} > 0;

param customers_reached_per_minute_or_per_page {advertising_platform};
param min_bounds {advertising_platform} >= 0;
param max_bounds {advertising_platform} >= 0;


var X {p in advertising_platform} >= min_bounds[p], <= max_bounds[p];


maximize audience_coverage: sum {p in advertising_platform} customers_reached_per_minute_or_per_page[p] * X[p];

subject to constraints {c in constraint_names}: sum {p in advertising_platform} constraint_list[p,c] * X[p] <= constraint_limits[c];