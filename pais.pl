pai(hommer, bart).
pai(hommer, lisa).
pai(avo_hommer, hommer).
pai(joao, avo_hommer).
pai(joao, irmao_avo_hommer).

avo(X,Y) :- pai(X,Z), pai(Z,Y). 

ancestral(X,Y) :- pai(X,Y).
ancestral(X,Y) :- pai(X,Z) , ancestral(Z,Y).


fat(N,F) :- >(N,0), 
	Aux is (N-1),
	fat(Aux, Faux),
        is(F, Faux*N).
fat(0,1).
