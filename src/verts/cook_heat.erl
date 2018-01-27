-module(cook_heat).

-behaviour(wrek_vert).
-export([run/2]).

run([Verb, Noun], _Pid) ->
    io:format("~ping ~p.~n", [Verb, Noun]),
    {ok, #{}}.
