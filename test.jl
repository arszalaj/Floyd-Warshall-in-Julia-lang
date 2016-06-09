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

@test iteracja([1,2,3]) == true
@test Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1).v2.value == "b"
krawedz1 = Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1);
krawedz2 = Krawedz(2,Wierzcholek(2,"b"),Wierzcholek(1,"a"),1);
@test iteracja_krawedzi(krawedz1, krawedz2) == true


 @test floyd_warshall(edge_list) == true
 @test is_neighbour(edge_list) != 0

 println("Test zakończony sukcesem4");
 println(time());
