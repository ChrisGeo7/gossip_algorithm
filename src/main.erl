-module(main).
-export([start/3, getConnectedActors/1]).
-import_module(server).

% Generic method to keep the track of neighbours of any node. Idea is to store the info in a map(PID, Neighbourlist) format
getConnectedActors(NeighbourMap) ->
    receive
        {Caller ,PID }->
            Caller ! maps:get(PID, NeighbourMap)
    end,
    getConnectedActors(NeighbourMap).
            

start(NumNodes, Topology, Algorithm)->
    case Topology of 
        line ->
            line:build(Algorithm, NumNodes);
        full ->
            full:build(Algorithm, NumNodes);
        '2D' ->
            twoDGrid:build(Algorithm, NumNodes);
        imp3D ->
            imp3D:build(Algorithm, NumNodes)
    end.       

