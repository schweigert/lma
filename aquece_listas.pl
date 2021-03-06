/* valor medio de uma lista  numerica */
med_lista([],0).
med_lista(L,M) :-
	soma(L,Total),
	length(L,C),
	M is (Total/C).
	
soma([],0).
soma([X|L], S) :- 
        soma(L, S_ant),
        S is (X + S_ant).	


/*  marka( In, Elem, X, Out) iff input list In will change to output list Out
    marked with an X after Elem.
    Fails if In does not contain Elem.
*/
ad_depois([],_,_,[]).
ad_depois( [Elem|T], Elem, X, [Elem,X|T] ).

ad_depois( [H|T], Elem, X, [H|T1] ) :-
    ad_depois( T, Elem, X, T1 ).

/*  doubl( In, Out) iff Out is the same as In after replacing two adjacent
    occurrences
    of any element by one occurrence of that element.
*/
del_duplos( [], []).

del_duplos( [ Elem, Elem| X], [ Elem| Y]) :-
   del_duplos( X, Y).

del_duplos( [ X| R1], [ X| R2]) :-
   del_duplos( R1, R2).


/*  Aux. predicates taken from NBS/ICST Prolog Utility Library vers 11.25.86
    member_rest( Elem, List, Rest) iff Elem is a member
    of List and Rest is the rest of the list following Elem.
*/
elem_resto( Elem, L , 'Elemento nao estah na lista') :- not(member(Elem, L)), !.
elem_resto( Elem, [ Elem| Rest], Rest).

elem_resto( Elem, [ _| Rest], Rest_rest) :-
   elem_resto( Elem, Rest, Rest_rest).



