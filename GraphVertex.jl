#!/usr/bin/julia
using Base.Test

type Wierzcholek
    value::ASCIIString
    Wierzcholek(x) = new(x)
end

type Krawedz
    v1::ASCIIString
    v2::ASCIIString
    weight::Int

    Krawedz(x,y,z) = new(x,y,z)
end

function iteracja(vertex::Wierzcholek{})
  for i=1:1:length(vertex)
    println(vertex[i].id);
  end

  return true;
end

function iteracja_krawedzi2(edge_list::Array{Krawedz})

  n = length(edge_list);
  dist = eye(n);
  prev = eye(n);
  vertex_list::Array{ASCIIString}

  for i in eachindex(edge_list)
    push!(vertex_list, edge_list.v1);
  end

    for u in eachindex(vertex_list)
      for v in eachindex(vertex_list)
        dist[u, v] = Inf;
        prev[u, v] = -1;
      end
      dist[u, u] = 0;
    end

    for t in eachindex(vertex_list)
      for u in eachindex(vertex_list)
        for v in eachindex(vertex_list)
            newLength = dist[u, t] + dist[t, v];
            # println("if");
            if newLength < dist[u, v]
              dist[u, v] = newLength;
              pred[u,v] = pred[t, v];
            end
          end
          dist[u, u] = 0;
      end
    end

println("dist =\n $(dist)");
println("prev =\n $(prev)");
println("vertex_list =\n $(vertex_list)");

  return true;
end


#@test iteracja(new Vector{}) == true
vertex_list = ["a" "b" "c"];
edge_list = [
Krawedz("a","b",1)
Krawedz("b","c",2)
Krawedz("a","c",4)];
 @test iteracja_krawedzi2(vertex_list, edge_list) == true

 println("Test zakończony sukcesem4");
