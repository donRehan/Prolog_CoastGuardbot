% Including our knowledge base
:- include('KB3.pl').
% Check in the end if the conditions are met before unifying
goal(S):- 
    result(A1,s0), 
	S = A1.

%helper method.
result(A,S0):- 
    agent_loc(X,Y), 
	grid(Y1,Y2),
	ships_loc([[SX,SY]]),
	result(A1,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc([[SX,SY]])),
	A = A1.

result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc([[SX,SY]])):-
	X < Y1,
	X1 is X + 1 ,
	A1 = result(down,S0),result(A2,A1,agent_loc(X1,Y),grid(Y1,Y2),ships_loc([[SX,SY]])),
	A = A2.
% Now the goal should be that no ships are left , we are on a station.
%up
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc([[SX,SY]])):- 
	X > 0,
	X1 is X - 1 , 
	A1 = result(up,S0),
	result(A2,A1,agent_loc(X1,Y),grid(Y1,Y2),ships_loc([[SX,SY]])),
	A = A2.
%left
%result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc([[SX,SY]])):- Y > 0,Y1 is Y - 1 , A1 = result(left,S0), result(A2,A1,agent_loc(X,Y1),grid(Y1,Y2),ships_loc([[SX,SY]])), A = A2.
%%right
%result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc([[SX,SY]])):- Y < Y2,Y1 is Y - 1 , A1 = result(right,S0), result(A2,A1,agent_loc(X,Y1),grid(Y1,Y2),ships_loc([[SX,SY]])), A = A2.
% this is the goal
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc([[SX,SY]])):-
	SX==X,
	SY ==Y ,
	A = S0.
