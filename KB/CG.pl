% Including our knowledge base
:- include('KB.pl').
% Check in the end if the conditions are met before unifying
goal(S):- 
    result(A1,s0), 
	S = A1.
%helper method.
result(A,S0):- 
    agent_loc(X,Y), 
	grid(Y1,Y2),
        station(SI,SII),
	ships_loc(LST),
        capacity(C),
	result(A1,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),[],station(SI,SII),C,0),
	A = A1.
%goal case
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),V,station(SI,SII),C,CR):-
	LST == [],
        X == SI,
        Y == SII,
	A = result(drop,S0).
%Minor Drop
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),V,station(SI,SII),C,CR):-
	C == CR,
        X == SI,
        Y == SII,
	A1 = result(drop,S0),
        result(A2,A1,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),[],station(SI,SII),C,0),
	A = A2.
%pickup
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),V,station(SI,SII),C,CR):-
        CR < C,
	member([X,Y],LST),
        list_delete([X,Y],LST,LST1),
	A1 = result(pickup,S0),
        CR1 is CR + 1,
        result(A2,A1,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST1),[],station(SI,SII),C,CR1),
	A = A2.

%down
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),V,station(SI,SII),C,CR):-
	X1 is X + 1 ,
	X1 < Y1,
        \+ member([X1,Y], V),
        append(V, [[X1,Y]], V1),
	A1 = result(down,S0),
        result(A2,A1,agent_loc(X1,Y),grid(Y1,Y2),ships_loc(LST),V1,station(SI,SII),C,CR),
	A = A2.
% Now the goal should be that no ships are left , we are on a station.
%up
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),V,station(SI,SII),C,CR):- 
	X1 is X - 1 , 
	X1 > 0,
        \+ member([X1,Y], V),
        append(V, [[X1,Y]], V1),
	A1 = result(up,S0),
	result(A2,A1,agent_loc(X1,Y),grid(Y1,Y2),ships_loc(LST),V1,station(SI,SII),C,CR),
	A = A2.

%left
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),V,station(SI,SII),C,CR):- 
	YI is Y - 1 , 
	YI > 0,
        \+ member([X,YI], V),
        append(V, [[X,YI]], V1),
	A1 = result(left,S0),
	result(A2,A1,agent_loc(X,YI),grid(Y1,Y2),ships_loc(LST),V1,station(SI,SII),C,CR),
	A = A2.

%%right
result(A,S0,agent_loc(X,Y),grid(Y1,Y2),ships_loc(LST),V,station(SI,SII),C,CR):- 
	YI is Y + 1 , 
	YI < Y2,
        \+ member([X,YI], V),
        append(V, [[X,YI]], V1),
	A1 = result(right,S0),
	result(A2,A1,agent_loc(X,YI),grid(Y1,Y2),ships_loc(LST),V1,station(SI,SII),C,CR),
	A = A2.

list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).
