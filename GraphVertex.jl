#!/usr/bin/julia
using Base.Test

type Wierzcholek
    id::Int
    value::ASCIIString

    Wierzcholek(x,y) = new(x,y)
end

type Krawedz
    id::Int
    v1::Wierzcholek
    v2::Wierzcholek
    weight::Int

    Krawedz(v,x,y,z) = new(v,x,y,z)
end

function iteracja(vertex::Wierzcholek{})
  for i=1:1:length(vertex)
    println(vertex[i].id);
  end

  return true;
end

function iteracja_krawedzi2(edge_list::Array{Krawedz})

  n::Int = length(edge_list);
  dist = eye(n);
    i = 1;
    for edge in edge_list
      # println(edge.id);
      # println("index =$(i)");

        j = 1;
          for edge in edge_list
            dist[i, j] = 1;
          # println("i = $(i), j = $(j)");
          j += 1;
          end

      i += 1;
    end

  return true;
end

#@test iteracja(new Vector{}) == true
edge_list = [Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1)
Krawedz(2,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1)
Krawedz(3,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1)];
 @test iteracja_krawedzi2(edge_list) == true

 println("Test zakończony sukcesem4");
