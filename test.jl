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
 @test iteracja_krawedzi2(edge_list) == true

 println("Test zakończony sukcesem4");
 println(time());
