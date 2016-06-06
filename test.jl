#!/usr/bin/julia
using Base.Test

# @test GraphVertex(1,"a").id == 1
vertex1 = Wierzcholek(1,"a");
vertex2 = Wierzcholek(2,"b");

# @test iteracja([1,2,3]) == true
@test Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1).v2.value == "b"
krawedz1 = Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1);
krawedz2 = Krawedz(2,Wierzcholek(2,"b"),Wierzcholek(1,"a"),1);
@test iteracja_krawedzi(krawedz1, krawedz2) == true
println("Test zakończony sukcesem");
