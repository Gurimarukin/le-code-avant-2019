:- module('../test', [
    expect/1, op(860, fy, expect),
    expect_true/1, op(860, fy, expect_true),
    expect_fail/1, op(860, fy, expect_fail),
    to_be/2, op(850, yfx, to_be),
    to_equal/2, op(850, yfx, to_equal)
]).


expect(Goal) :- Goal.


expect_true(Goal) :- Goal, !.
expect_true(Goal) :-
    format('\nexpected: "~w" to be true but failed', [Goal]), fail.

expect_fail(Goal) :- not(Goal), !.
expect_fail(Goal) :-
    format('\nexpected: "~w" to fail but was true', [Goal]), fail.


to_be(Expected, Expected) :- !.
to_be(Got, Expected) :-
    format('\nexpected: "~w" but got: "~w"', [Expected, Got]), fail.


to_equal(Got, Expected) :- Got == Expected, !.
to_equal(Got, Expected) :-
    format('\nexpected: "~w" but got: "~w"', [Expected, Got]), fail.
