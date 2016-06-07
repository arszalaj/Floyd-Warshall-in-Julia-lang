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

function is_neighbour(v1::ASCIIString, v2::ASCIIString, edge_list::Array{Krawedz})
  for edge in edge_list
    if(edge.v1 == v1 && edge.v2 == v2)
        println("edge.v1 = $(edge.v1), v1 = $(v1), edge.v2 = $(edge.v2), v2 = $(v2)");
      return edge;
    end
  end
  return 0;
end

function iteracja_krawedzi2(edge_list::Array{Krawedz})

  vertex_list = [];

  for edge in edge_list
    push!(vertex_list, edge.v1, edge.v2);
  end

  vertex_list = unique(vertex_list);

    n = length(vertex_list);
    dist = eye(n);
    prev = eye(n);

    for u in eachindex(vertex_list)
      for v in eachindex(vertex_list)
        dist[u, v] = Inf;
        prev[u, v] = -1;
      end
      dist[u, u] = 0;
      for v in eachindex(vertex_list)
        if (edge = is_neighbour(vertex_list[u], vertex_list[v], edge_list)) != 0
          println("$(vertex_list[u]) is a neighbour of $(vertex_list[v])");
          dist[u, v] = edge.weight;
          prev[u, v] = u;
        end
      end
    end

    for t in eachindex(vertex_list)
      for u in eachindex(vertex_list)
        for v in eachindex(vertex_list)
            newLength = dist[u, t] + dist[t, v];
            # println("if");
            if newLength < dist[u, v]
              dist[u, v] = newLength;
              prev[u,v] = prev[t, v];
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
Krawedz("a","c",4)
Krawedz("d","b",3)
Krawedz("b","e",2)
Krawedz("c","e",1)];
 @test iteracja_krawedzi2(edge_list) == true

 println("Test zakończony sukcesem4");
 println(time());
