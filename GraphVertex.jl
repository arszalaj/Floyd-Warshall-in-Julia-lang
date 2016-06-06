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
  prev = eye(n);
    u = 1;
    for edge in edge_list

      v = 1;
      for edge in edge_list
        dist[u, v] = Inf;
        prev[u, v] = -1;
        v += 1;
      end

      dist[u, u] = 0;
      u += 1;
    end


    t = 1;
    for edge in edge_list
      u = 1;
      for edge in edge_list
          v = 1;
          for edge in edge_list
            newLength = dist[u, t] + dist[t, v];
            println("if");
            if newLength < dist[u, v]
              dist[u, v] = newLength;
              pred[u,v] = pred[t, v];

            end
              v += 1;
          end

          dist[u, u] = 0;
          u += 1;
      end
      t += 1;
    end

println("dist =\n $(dist)");
println("prev =\n $(prev)");

  return true;
end

#@test iteracja(new Vector{}) == true
edge_list = [Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1)
Krawedz(2,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1)
Krawedz(3,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1)];
 @test iteracja_krawedzi2(edge_list) == true

 println("Test zakończony sukcesem4");
