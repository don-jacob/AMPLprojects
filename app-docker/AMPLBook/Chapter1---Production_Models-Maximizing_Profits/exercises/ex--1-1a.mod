set advertising_platform; #contains list of different advertising platforms - TV, magazines etc.

param budget >= 0;
param cost_per_minute_or_per_page {advertising_platform} >= 0;
param customers_reached_per_minute_or_per_page {advertising_platform} >= 0;
param min_TVminutes {advertising_platform} >= 0;

var X {p in advertising_platform} >= min_TVminutes[p];

maximize audience_coverage: sum {p in advertising_platform} customers_reached_per_minute_or_per_page[p] * X[p];

subject to Budget: sum {p in advertising_platform} cost_per_minute_or_per_page[p] * X[p] <= budget;