:- module(utils, [
    relative_file/3,
    file_lines/2,
    as_numbers/2
]).


relative_file(Module, File, Res) :-
    module_property(Module, file(ModuleFile)),
    relative_file_name(Res, ModuleFile, File).


file_lines(File, Res) :-
    read_file_to_string(File, Content, []),
    split_string(Content, "\n", "", Res).


string_number(Str, [N]) :-
    number_string(N, Str), !.

string_number(_, []).


as_numbers(NotNs, Ns) :-
    maplist(string_number, NotNs, Temp),
    flatten(Temp, Ns).
