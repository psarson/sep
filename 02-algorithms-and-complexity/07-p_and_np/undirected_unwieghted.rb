require_relative 'vertex'
require_relative 'edge' 

class Weighted_Undirected
  def initialize(vertices = nil)
    @adj = Hash.new
    if(!vertices.nil?)
      vertices.each { |vertex| @adj[vertex] = Array.new }
    end
    @edge_number = 0
  end

  def add_edge(edge)
    v1 = get_or_create(edge.either)
    v2 = get_or_create(edge.other(v1))
    @adj[v1].push(edge)
    if(v1 != v2) then @adj[v2].push(edge) end # If start == from we don't want to add the edge twice

    @edge_number += 1
  end

  def get_or_create(vertex)
    array_id = vertices.find_index(vertex)
    return vertices[array_id] if array_id
    @adj[vertex] = Array.new
    vertex
  end

  def edges # returns an Array containing all the graph vertices
    edges = Array.new
    @adj.each do |vertex, _edges|
      _edges.each do |edge|
        if(edge.other(vertex) > vertex) # as we are currently using un undirected graph, we don't want to add the same edge twice
          edges.push(edge)
        end
      end
    end
    edges
  end

  def vertices_number
    @adj.size
  end

  def vertices
    @adj.keys
  end

  def adj(vertex)
    validate_vertex(vertex)
    @adj[vertex].dup
  end

  def degree(vertex)
    validate_vertex(vertex)
    @adj[vertex].size
  end

  private
  def validate_vertex(vertex)
    raise 'Vertex is not part of the graph' if !@adj.has_key?(vertex)
  end

  def get_or_create(vertex)
    array_id = vertices.find_index(vertex)
    return vertices[array_id] if !array_id.nil?
    @adj[vertex] = Array.new
    vertex
  end
end
