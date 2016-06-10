#!/usr/bin/julia
using Base.Test



#@test iteracja(new Vector{}) == true
vertex_list = ["a" "b" "c"];
edge_list = [
Krawedz("a","b",1)
Krawedz("b","c",2)
Krawedz("a","c",4)
Krawedz("d","b",3)
Krawedz("b","e",2)
Krawedz("c","e",1)];

# @test iteracja([1,2,3]) == true
@test Krawedz("a","b",1).v2 == "b"
println("Edge constructor test passed\n");

display_edges(edge_list);
@test floyd_warshall(edge_list) == true
println("Floyd Warshall function test passed");

@test is_neighbour("a","b", edge_list) != 0
@test is_neighbour("a","c", edge_list) != 0
@test is_neighbour("a","d", edge_list) == 0
@test is_neighbour("a","e", edge_list) == 0
@test is_neighbour("b","c", edge_list) != 0
@test is_neighbour("b","e", edge_list) != 0
println("Checking the neighbour tests passed");

println("\nAll the test are passed");
println(time());
