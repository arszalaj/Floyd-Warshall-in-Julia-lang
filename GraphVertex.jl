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

function iteracja(vertex::Wierzcholek)
  for i=1:1:length(vertex)
    println(vertex[i].id);
  end

  return true;
end

function iteracja_krawedzi(edge_list::Krawedz{})

    println(edge_list.id);


  return true;
end

# @test iteracja([1,2]) == true

println("Test zakończony sukcesem");
# @test iteracja_krawedzi([Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1), Krawedz(1,Wierzcholek(1,"a"),Wierzcholek(2,"b"),1)]) == true
