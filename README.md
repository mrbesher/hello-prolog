# hello-prolog  
A collection of code files written during "Intro to Expert Systems" class tought by [Fatih Amasyali](https://sites.google.com/view/mfatihamasyali).  

## How to run?  
The programs provided where run using [SWI-Prolog](https://www.swi-prolog.org/).  
Programs can by run using the following command:   
```$ swipl main.pl```  

## shortestpath Folder  
Finds the shortest path passing from three "concepts" (practically nodes) in any order. Edges between nodes are relations between concepts and constraints can be applied on relations types.  
The concepts and their relations are provided in the accompanying files `isimler.pl` and `fiiller.pl` in the following format:
```iliski(C1,R,C2).```  

### How to use?  
Run as follows:
```
$ swipl main.pl
```
To start the program call the predicate `go`. Enter a desired concept after each input prompt then specify relations. Use 'hepsi' keyword to allow all relations.  
```prolog
?- go.
kavram1: 'word1'.
kavram2: 'word2'.
kavram3: 'word3'.
istenen iliski turleri: ['R1', 'R2', 'R3']
```

## isFib.pl  
Checks if a list is a Fibonacci sequence.  

## sumOfSquares.pl  
Sums the squares of numbers in a given list

## kurtlu-hikaye.pl  
Tries to determine why the wolf will abandon his plan of eating the girl in the following famous story:  
> A small girl is walking through a forest to visit her grandmother, and she passes a bush behind which a Wolf is hiding, planning to pounce out and eat her. Just as she gets close, however, the Wolf hears the singing of the woodcutters as they start work nearby. The Wolf therefore decides to stay hidden and not pounce on the little girl after all. The problem is to explain why the Wolf decides to stay behind the bush.  

_Contributed by Pat Hayes, Institute for the Interdisciplinary Study of Human and Machine Cognition, University of West Florida, U.S.A. and Lokendra Shastri, International Computer Science Institute, Berkeley, California, U.S.A. (9th July, 1997)_  
For more examples: [https://commonsensereasoning.org/problem_page.html](https://commonsensereasoning.org/problem_page.html#wolfandbush)  


## worksincountry.pl  
Figures out the company that Hilmi works at based on the location of the last vehicle he used.

## incrlistvaluesby1.pl  
Increases list elements by one.