isFib([H1 | []]).
isFib([H1, H2 | []]).
isFib([H1, H2, H3 | T]):- H3 is H1+H2, isFib([H2,H3|T]).

