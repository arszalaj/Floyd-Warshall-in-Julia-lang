#!/usr/bin/julia
using Base.Test

type Krawedz
    v1::ASCIIString
    v2::ASCIIString
    weight::Int

    Krawedz(x,y,z) = new(x,y,z)
end

function is_neighbour(v1::ASCIIString, v2::ASCIIString, edge_list::Array{Any,1})
  for edge in edge_list
    if(edge.v1 == v1 && edge.v2 == v2)
        # println("edge.v1 = $(edge.v1), v1 = $(v1), edge.v2 = $(edge.v2), v2 = $(v2)");
      return edge;
    end
  end
  return 0;
end


function floyd_warshall(edge_list::Array{Any,1})

  vertex_list = [];

  for edge in edge_list
    push!(vertex_list, edge.v1, edge.v2);
  end

  vertex_list = unique(vertex_list);

  # println(edge_list);
  #   println(vertex_list);

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
          # println("$(vertex_list[u]) is a neighbour of $(vertex_list[v])");
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

println("dist =\n $(dist)\n");
# println("prev =\n $(prev)");
# println("vertex_list =\n $(vertex_list)");

  return true;
end


function display_edges(edge_list::Array{Any,1})
  for edge in edge_list
  	println(" vertex1 = $(edge.v1) vertex2 = $(edge.v2) weight  = $(edge.weight)\n");
  end
end
