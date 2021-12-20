command_loop:-
        write('Welcome to Nani Search'), nl,
        repeat,
        write('>nani> '),
        read(X),
        do(X), nl,
        end_condition(X).

end_condition(end).
end_condition(X) :- 
        have(X),!,
        write('Congratulations').

do(X):- have(X),!.
do(end).
do(_):- write('Invalid Command').

have(X):- X==nani,!.