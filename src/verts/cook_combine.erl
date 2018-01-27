-module(cook_combine).

-behaviour(wrek_vert).
-export([run/2]).

run([Ingredients, Vessel], Pid) ->
    Fun = fun(Step, Acc) ->
              Stuff = wrek_vert:get(Pid, Step, added),
              io:format("combining ~p with ~p in ~p.~n", [Stuff, Acc, Vessel]),
              Stuff ++ Acc
          end,
    Stuff = lists:foldl(Fun, [], Ingredients),
    io:format("~p now contains: ~p.~n", [Vessel, Stuff]),
    {ok, #{added => Stuff}}.
