-module(cook_add).

-behaviour(wrek_vert).
-export([run/2]).

run([Ingredient, Quantity], _Pid) ->
    io:format("adding ~s. amount: ~s.~n", [Ingredient, Quantity]),
    {ok, #{added => [{Ingredient, Quantity}]}}.
