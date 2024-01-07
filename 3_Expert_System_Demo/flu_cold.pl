% flu_cold.pl
% Flu or cold identification example
% Start with ?- go.

go:- hypothesis(Disease),
    write('I believe you have: '),
    write(Disease),
    nl,
    undo.

% Hypothesis to be tested
hypothesis(cold):- cold, !.
hypothesis(flu):- flu, !.

% Hypothesis Identification Rules
cold :-
       verify(headache),
       verify(runny_nose),
       verify(sneezing),
       verify(sore_throat).
flu :-
       verify(fever),
       verify(headache),
       verify(chills),
       verify(body_ache).

% Ask a question
ask(Question) :-
    write('Do you have the following symptom: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

% Verify something
verify(S) :- (yes(S) -> true ;
               (no(S)  -> fail ;
               ask(S))).

% Undo all yes/no assertions
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.