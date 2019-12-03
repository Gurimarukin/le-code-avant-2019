:- use_module('../utils/test').
:- use_module(day1).


:- begin_tests(day1).

% Part 1
test('fuel(12)') :-
    fuel(12, Res),
    expect Res to_be 2.

test('fuel(14)') :-
    fuel(14, Res),
    expect Res to_be 2.

test('fuel(1969)') :-
    fuel(1969, Res),
    expect Res to_be 654.

test('fuel(100756)') :-
    fuel(100756, Res),
    expect Res to_be 33583.

% Part 2
test('full_fuel(14)') :-
    full_fuel(14, Res),
    expect Res to_be 2.

test('full_fuel(1969)') :-
    full_fuel(1969, Res),
    expect Res to_be 966.

test('full_fuel(100756)') :-
    full_fuel(100756, Res),
    expect Res to_be 50346.

:- end_tests(day1).
