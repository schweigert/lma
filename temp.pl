
go1 :- solucao([CARRO1, CARRO2, CARRO3, CARRO4, CARRO5]), 
 	   writeln("\nVAGA 1" : CARRO1), 
	writeln("\nVAGA 2" : CARRO2), 
	writeln("\nVAGA 3" : CARRO3), 
	writeln("\nVAGA 4" : CARRO4),
	writeln("\nVAGA 5" : CARRO5).

go2 :- solucao(L), imprime_lista(L).

solucao([(D1, C1, M1, P1, A1, T1),
       (D2, C2, M2, P2, A2, T2),
	   (D3, C3, M3, P3, A3, T3),
	   (D4, C4, M4, P4, A4, T4),
       (D5, C5, M5, P5, A5, T5)]):-
    
    /* AGRUPAR OS FATOS ..... */
    dono(D1), dono(D2), dono(D3), dono(D4) , dono(D5),
    alldifferent([D1, D2, D3, D4, D5]),
     % o carro de rogerio está em uma das extremidades.
     (D1 == rogerio; D5== rogerio),
    
    
    
    %/cor
    cor(C1), cor(C2), cor(C3), cor(C4), cor(C5),
    
    C2 == vermelha ,
        
    alldifferent([C1, C2, C3, C4, C5]),
    
    %/montadora
    montadora(M1), montadora(M2), montadora(M3), montadora(M4), montadora(M5),
    
    M4 == francesa ,
       
    alldifferent([M1, M2, M3, M4, M5]),
    
    %/placa
    placa(P1), placa(P2), placa(P3), placa(P4), placa(P5),
        
    alldifferent([P1, P2, P3, P4, P5]),
    
    %/ano
    ano(A1), ano(A2), ano(A3), ano(A4), ano(A5),
    
    I3 == 2010,
      
    alldifferent([A1, A2, A3, A4, A5]),
 
    %/tipo
    tipo(T1), tipo(T2), tipo(T3), tipo(T4), tipo(T5),
        
        T5 == pickup,
        T2 == suv,
        
    alldifferent([T1, T2, T3, T4, T5]),
        
  
        
    % o sedan está ao lado da pickup
     T5 == pickup,
     T4 == sedan,
        
    % O veiculo fabricado em 2009 é uma pickup. 
     T5 == pickup, 
     A5 == 2009,
    
    % o sedan tem placa eee5555. 
    T4 == sedan,
    P5 == eee5555,
     
    % alexandre dirige o crossover
    (
    (D1 == alexandre, T1 == crossover);
    (D3 == alexandre, T3 == crossover)
    ),
    
    % o crossover é amarelo 
    (
     (T1 == crossover, C1 == amarela);
     (T3 == crossover, C3 == amarela)
    ),
    
    % o carro de 2008 está ao lado do carro azul.
    (   
    (A1 == 2008, C2 == azul);
    (A2 == 2008, (C1== azul; C3 == azul)); 
    (A4 == 2008, (C3 == azul; C5 == azul))
    ),
    
    % o carro com placa ccc3333 é de 2007.
    (   
    (A1 == 2007, P1 == ccc3333);
    (A2 == 2007, P2 == ccc3333); 
    (A3 == 2007, P3 == ccc3333)
    ),
    
    % O carro com a placa DDD-4444 está ao lado do carro do Guilherme.
    (   
    (P1 == ddd4444, D2 == guilherme);
    (P2 == ddd4444,(D1 == guilherme; D3 == guilherme));    
    (P3 == ddd4444,(D2 == guilherme; D4 == guilherme)); 
    (P5 == ddd4444, D4 == guilherme) 
    ),    
        
    % O carro Alemão está em algum lugar à direita do carro do Felipe.
    (   
    (M1 == alema, D1 == felipe);
    (M2 == alema, (D1 == felipe; D2 == felipe));
    (M5 == alema, (D1 == felipe; D2 == felipe; D3 == felipe; D4 == felipe))
    ),
    
    % O carro Branco está exatamente à direita do veículo Japonês.
    (   
    (M1 == japonesa, C2 == branca);   
    (M2 == japonesa, C3 == branca);
    (M3 == japonesa, C4 == branca)
    ), 
    
    % O carro Italiano está exatamente à esquerda do Crossover.
    (
    (T1 == crossover, M2 == italiana);
    (T3 == crossover, M4 == italiana)
    ),
     
    % O veículo Chinês está em alguma vaga à esquerda do carro Branco.
    (
    (C3 == branca, (M1 == chinesa; M2 == chinesa));
    (C4 == branca, (M1 == chinesa; M2 == chinesa; M3 == chinesa));   
    (C5 == branca, (M1 == chinesa; M2 == chinesa; M3 == chinesa))
    ),
        
    % O veículo Italiano foi fabricado em 2007.    
    (    
    (A1 == 2007, M1 == italiana);
    (A2 == 2007, M2 == italiana);   
    (A4 == 2007, M4 == italiana) 
    ),
        
    % O carro do Gilmar está exatamente à direita do carro Branco.
    (    
    (C3 == branca, D2 == gilmar);
    (C4 == branca, D3 == gilmar);
    (C5 == branca, D4 == gilmar)
    ),
     
    % O carro do Alexandre está em algum lugar entre os
    %carros de placas DDD-4444 e AAA-1111, com este último à direita.
    (
    (P3 == aaa1111, D2 == alexandre);
    (P5 == aaa1111 , (D2 == alexandre; D3 == alexandre; D4 == alexandre))
    ,
    (   
    (P1 == ddd4444, (D2 == alexandre; D3 == alexandre; D4 == alexandre));
    (P2 == ddd4444, (D3 == alexandre; D4 == alexandre)); 
    (P3 == ddd4444, D4 == alexandre)
     )
     .
 
