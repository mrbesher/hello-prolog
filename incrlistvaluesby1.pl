sum1([H],S):-G is H+1, S=[G].
sum1([H|T],S):-sum1(T,D),G is H+1,S=[G|D].
