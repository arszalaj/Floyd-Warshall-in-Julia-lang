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
      return true;
    end
  end
  return false;
end

function iteracja_krawedzi2(edge_list::Array{Krawedz})

  n = length(edge_list);
  dist = eye(n);
  prev = eye(n);
  vertex_list = [];

  for edge in edge_list
    push!(vertex_list, edge.v1, edge.v2);
  end

  vertex_list = unique(vertex_list);

  for vertex1 in vertex_list
    for vertex2 in vertex_list
      if is_neighbour(vertex1, vertex2, edge_list)
        println("$(vertex1) is neighbour of $(vertex2)");
      end
    end
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

# println("dist =\n $(dist)");
# println("prev =\n $(prev)");
println("vertex_list =\n $(vertex_list)");

  return true;
end


#@test iteracja(new Vector{}) == true
vertex_list = ["a" "b" "c"];
edge_list = [
Krawedz("a","b",1)
Krawedz("b","c",2)
Krawedz("a","c",4)];
 @test iteracja_krawedzi2(edge_list) == true

 println("Test zakończony sukcesem4");
 println(time());
