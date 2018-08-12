#PART 1: DECISION VARIABLES
var roth >= 0 integer;
var traditional >= 0 integer;
var surplus >= 0 integer;

#PART 2: OBJECTIVE FUNCTION
maximize z: roth*2*12*2 + traditional*2*12 + surplus;
#The second 2 here is because I value roth twice more than traditional. 

#PART 3: CONSTRAINTS
s.t. M1: roth*2*12  <= 5500;
s.t. M2: roth*2*12 + traditional*2*12 + surplus = 18500;