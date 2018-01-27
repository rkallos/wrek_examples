-module(wrek_example).

-export([make_pasta/0]).

make_pasta() ->
    application:ensure_all_started(wrek),
    Graph = #{
      tomatoes => #{
        module => cook_add,
        args => ["pureed tomatoes", "1 can"],
        deps => []
       },
      vegetables => #{
        module => cook_add,
        args => ["chopped vegetables", "lots"],
        deps => []
       },
      spices => #{
        module => cook_add,
        args => ["spices", "to taste"],
        deps => []
       },
      saucepan => #{
        module => cook_combine,
        args => [[tomatoes, vegetables, spices], saucepan],
        deps => [tomatoes, vegetables, spices]
       },
      simmer_sauce => #{
        module => cook_heat,
        args => [simmer, sauce],
        deps => [saucepan]
       },
      boil_water => #{
        module => cook_heat,
        args => [boil, water],
        deps => []
       },
      add_pasta => #{
        module => cook_add,
        args => ["pasta", "1 handful"],
        deps => [boil_water]
       },
      cook_pasta => #{
        module => cook_heat,
        args => [cook, pasta],
        deps => [add_pasta]
       },
      mix_pasta_with_sauce => #{
        module => cook_combine,
        args => [[saucepan, add_pasta], saucepan],
        deps => [simmer_sauce, cook_pasta]
       }
     },
    wrek:start(Graph).
