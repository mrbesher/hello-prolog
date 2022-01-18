:- use_module(library(lists)).
:- dynamic bfs/5.
:-include('fiiller.pl').
:-include('isimler.pl').


% count the number of elements in a list
count([], 0).
count([_|T], N):- count(T, N1), N is N1+1.

% X: Source, Y: Destination, Permitted: The relations specified to serach through, P: Path, C: Cost
bfs(X, Y, Permitted, P, C) :-                 
  bfs_collection(Y,[n(X,[])],[n(X,[])], Permitted, R),
  reverse(R,P),
  count(P,C),                                 % Updates the cost based on the length of the path
  asserta(bfs(X, Y, Permitted, P, C)),        
  !.


% If the the source is the same as the destination stop and return the path 
bfs_collection(Y,[n(Y,P)|_],_,_,P).


% S: Source, Y: Destination, Permitted: The relations specified to serach through, P: Path, C: collection
% reference: "Lecture 10: Breadth first search in Prolog", Brian Logan
bfs_collection(Y,[n(S,P1)|Ns],C,Permitted,P) :-
  % Get all the the words that have permitted connection with the source and not visited before and assign them to Es
  findall(n(D,[p(S,A,D)|P1]),
    (iliski(S,A,D), member(A, Permitted), \+ member(n(D,_),C)),
    Es),
  % Add all possible paths list to prev. nodes through O
  append(Ns,Es,O),
  % Add all possible paths list to collections through C1
  append(C,Es,C1),
  % call the function again with constraints of collections and paths found in current call
  bfs_collection(Y,O,C1,Permitted,P).


% initial condition for shortest_path_nodes (no node left in list)
shortest_path_nodes([_|[]], _, 0, []).

% [X,Y,T]: The nodes that a path will be calculated for in order
shortest_path_nodes([X,Y|T], Permitted, MinCost, [Path1|PathN]) :-
    shortest_path_nodes([Y|T], Permitted, MinCostN, PathN), % send the rest of the list
    bfs(X, Y, Permitted, Path1, MinCost1), % find the shortest path between X, Y
    MinCost is MinCost1+MinCostN, % Total cost is the cost for the rest of the list and X-Y path
    !.

% returns the minimum path possible for all permutations
get_perm_with_min(List, Permitted, MinCost, Path) :-
  perm(List, X),
  % get the shortest path for the specified permutation
  shortest_path_nodes(X, Permitted, MinCost, Path),
  % where no other permutation has a path with a lesser cost
  \+ (
    perm(List, Y),
    shortest_path_nodes(Y, Permitted, LessCost, _),
    LessCost < MinCost
  ).

% try get_perm_with_min only once
uniq_shortest_path_nodes(List, Permitted, MinCost, Path):-
  get_perm_with_min(List, Permitted, MinCost, Path),
  !.


% get the shortest path, write it and write the cost
shortest_path_driver(List, Permitted) :-
    uniq_shortest_path_nodes(List, Permitted, MinCost, Path),
    write_path(Path),
    write('  Cost: '),
    write(MinCost),
    nl,
    !.

% Function to start the program
go() :-
    get_list_from_usr(List),
    % get allowed relations from user
    get_permitted_usr(Permitted),
    shortest_path_driver(List, Permitted).

% generic predicates
takeout(X,[X|R],R).
takeout(X,[F |R],[F|S]) :- takeout(X,R,S).

perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).
perm([],[]).

% I/O predicates
write_path([[p(S, R, D)|[]]|[]]) :-
    write('iliski('),
    write(S),
    write(','),
    write(R),
    write(','),
    write(D),
    write(').'),
    !.

write_path([[p(S, R, D)|[]]|Tail]) :-
    write('iliski('),
    write(S),
    write(','),
    write(R),
    write(','),
    write(D),
    write('), '),
    write_path(Tail),
    !.

write_path([[p(S, R, D)|T]|Tail]) :-
    write('iliski('),
    write(S),
    write(','),
    write(R),
    write(','),
    write(D),
    write('), '),
    write_path([T|Tail]),
    !.

% Function to get input from user
get_list_from_usr([N1, N2, N3]) :-
    write('kavram1: '),
    read(N1),
    nl,
    write('kavram2: '),
    read(N2),
    nl,
    write('kavram3: '),
    read(N3),
    nl.

% Function to spedcify the wanted relations
get_permitted_usr(Permitted) :-
  write('istenen iliski turleri: '),
  read(Choice),
  adjust_choice(Choice, Permitted).


adjust_choice('hepsi', ['Kim/ne ile yapılır?', 'Kim/ne yapar?', 'Nasıl yapılır?',
                        'Ne olunca yapılır?', 'Nerede yapılır?',  'Neye/kime yapılır?',
                        'Neyi/kimi yapılır?', 'Niçin yapılır?', 'Tanımı nedir?', 'Yapınca ne olur?',
                        'canlx/cansxz', 'ixinde neler bulunur?','hammaddesi nedir?', 'kim kullanxr',
                        'nerede bulunur? ', 'rengi', 'tanxmx nedir?', 'yanxnda neler bulunur?',
                        'xst kavramx nedir?','xekli nasxl?']).

adjust_choice(Choice, Choice).