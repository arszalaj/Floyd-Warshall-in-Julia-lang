#!/usr/bin/julia
include("GraphVertex.jl")

edge_list = [];

control = "y\n"

println("Edges definition:")
while(control != "n\n")

	println("vertex 1 name:")
	v1 = readline(STDIN)
	println("vertex 2 name:")
	v2 = readline(STDIN)
	println("edge weigth:")
	weight = readline(STDIN)

  push!(edge_list, Krawedz(v1, v2, parse(Int,weight)))

	println("\t\tNext edge? y/n")
	control = readline(STDIN)
end

println("\nYou graph is following (described by edges list):\n");
display_edges(edge_list);

println("\nThe matrix of the shortest paths is following:");
floyd_warshall(edge_list);

println("\n")

println("DONE!")
