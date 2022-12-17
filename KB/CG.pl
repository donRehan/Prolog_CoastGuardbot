% Including our knowledge base
:- include('KB3.pl').

goal(S):- result(A1,s0) , S = result(A1,s0). 

%result(right,result(down,s0))
result(A,s0):- agent_loc(X,Y), grid(Y1,Y2),  X < Y1 , A = down.
% Set X to X-1 if its less than the alue of Y1 in grid(Y1,Y2) and set A to right

/*
check how they return the result , its basically result(action , result ... result(action,s0)
*/
