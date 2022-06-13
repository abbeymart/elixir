-module(useless).
-export([add/2, hello/0, greet_and_add_two/1, multiply_by_100/1]).
 
add(A,B) ->
    A + B.
 
%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
    % Name = "Abi",
    io:format("Hello, world!~n").
 
greet_and_add_two(X) ->
    hello(),
    add(X,2).

multiply_by_100(X) ->
    X * 100.