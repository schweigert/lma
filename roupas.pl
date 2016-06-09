
pessoa(ale).
pessoa(babe).
pessoa(rosa).

cor(azul).
cor(amarelo).
cor(vermelho).
cor(lilaz).
cor(verde).


/* este pedaço é importante... pois....
está dito no problema e define uma
cor para cada moça */

tem_uma_cor(babe,amarelo).
tem_uma_cor(rosa,verde).
tem_uma_cor(ale,azul).


nao_veste(babe,verde).
nao_veste(rosa,azul).
nao_veste(rosa,lilaz).

veste(X, Cor1, Cor2) :- 
	pessoa(X),
	cor(Cor1),
	cor(Cor2),
	tem_uma_cor(X,Cor1),
	\+(nao_veste(X,Cor2)),
	Cor1 \== Cor2 , 		/* C1 diferente de C2 */ 
	(
	\+(Cor1 = vermelho) ,  /* C1 tem que ser diferente de Vermelho */
	\+(Cor2 = amarelo)    /* idem para amarelo.... */
	;
	\+(Cor1 = amarelo) ,  /* C1 tem que ser diferente de Vermelho */
	\+(Cor2 = vermelho)
	).    /* idem para amarelo.... */



/*
veste(X, Cor1, Cor2) :- 
	pessoa(X),
	cor(Cor1),
	cor(Cor2),
	tem_uma_cor(X,Cor1),
	\+(nao_veste(X,Cor2)),
	 Cor1 = vermelho , Cor2 = amarelo. 
*/

ache :- veste(X,C1,C2), 
	write(X), 
	write('   ====> '), write(C1),
	write('.... e ....'), write(C2),
	nl,
	fail.
ache.
