:- module(day1, [fuel/2, full_fuel/2]).

:- use_module('../utils/utils').


fuel(Mass, Res) :-
    Res is floor(Mass / 3) - 2.


full_fuel(Mass, Res) :-
    full_fuel_rec(0, Mass, Res).

full_fuel_rec(Acc, Mass, Res) :-
    fuel(Mass, Fuel),
    full_fuel_rec_bis(Acc, Fuel, Res).

full_fuel_rec_bis(Acc, Fuel, Acc) :- Fuel =< 0, !.
full_fuel_rec_bis(Acc, Fuel, Res) :-
    NewAcc is Acc + Fuel,
    full_fuel_rec(NewAcc, Fuel, Res).


add(X, Y, Sum) :- Sum is X + Y.

sum_fuels(Masses, Sum) :-
    maplist(fuel, Masses, Fuels),
    foldl(add, Fuels, 0, Sum).


sum_full(Masses, Sum) :-
    maplist(full_fuel, Masses, Fuels),
    foldl(add, Fuels, 0, Sum).


main :-
    relative_file(day1, './input', File),
    file_lines(File, Lines),
    as_numbers(Lines, Masses),

    sum_fuels(Masses, Base),
    write("Part 1: "), writeln(Base),

    sum_full(Masses, Full),
    write("Part 2: "), writeln(Full).
