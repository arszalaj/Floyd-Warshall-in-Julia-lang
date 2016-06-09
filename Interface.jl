include("GraphVertex.jl")
initialNode = null

edge_list = [];

control = "y\r\n"

while(control == "y\r\n")

	# if control != "n\r\n"
	# 	error("In case you don't want to start POSTORDER algoritm type 'continue'!")
	# end

	println("Edges definition:")
	println("vertex 1 name:")
	v1 = readline(STDIN)
	println("vertex 2 name:")
	v2 = readline(STDIN)
	println("edge weigth:")
	weight = int(readline(STDIN))

  push!(edge_list, Krawedz(v1, v2, weight))

	println("\t\tNext edge? y/n")
	control = readline(STDIN)
end

println("You graph is following (described by edges list):");
for edge in edge_list
	println(" vertex1 = $(edge.v1) vertex2 = $(edge.v2) weight  = $(edge.weight)\n");
end

floyd_warshall(edge_list);

println("\n\n")

# len = length(tree.nodes)
# if len > 0
# 	println("Printing nodes:")
# 	for i in 1:len
# 		println(NodeToString(tree.nodes[i]))
# 	end
# 	println("Nodes printed!")
# end
#
# println("\n\n")
#
# path = []
#
# println("Performing Post Order algoritm...\n\n")
#
# PostOrder(initialNode, tree, path)
#
# println("Printing generated path...\n\n")
#
# PostOrderPathToString(path, tree)
#
# println("DONE!")
