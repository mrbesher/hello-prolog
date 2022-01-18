sumOfSquares([], 0).
sumOfSquares([H|T], S):-H1 is H*H,sumOfSquares(T,S1),S is S1+H1.
