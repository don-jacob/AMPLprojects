#Variables
var XB;
var XC;

#Objective Function
maximize Profit: 25 * XB + 30 * XC;

#Constraints
subject to Time: (1/200) * XB + (1/400) * XC <= 40;
subject to B_limit: 0 <= XB <= 6000;
subject to C_limit: 0 <= XC <= 4000;
