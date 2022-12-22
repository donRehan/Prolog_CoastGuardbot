% Create a list that contains the element [2,1] and [1,1]

listt([[2,1],[1,1]]).

% Create a method that checks wether a given listt contains a given element 

contains([H|_],H).
contains([_|T],E) :- contains(listt(T),E).

list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).
