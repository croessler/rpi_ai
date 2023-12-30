%% a simple Prolog knowledge base
%% facts
orbits(earth, sun).
orbits(saturn, sun).
orbits(titan, saturn).
%% rules
satellite(X) :- orbits(X, _).
planet(X) :- orbits(X, sun).
moon(X) :- orbits(X, Y), planet(Y).
