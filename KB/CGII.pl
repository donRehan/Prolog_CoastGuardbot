:- include('KB3.pl').

goal(S):-
    agent_loc(X,Y),
    capacity(C),
    s(agent_loc(X,Y),C,S1),
    S = S1.

% right
s(agent_loc(X,Y), C, result(right,S)) :- 
    s(agent_loc(X,Y2), C, S1), %previous state S
    Y is Y2 + 1, %Y2 of previous state
    grid(D1,D2), %to get th e dimensions of the grid
    Y < D2-1, %make sure that Y2 of the previous state is still in the borders.
    S = S1. %the result is the same as the previous state

s(agent_loc(X,Y), C, s0).
