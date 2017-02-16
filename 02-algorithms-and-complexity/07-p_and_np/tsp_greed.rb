require_relative 'node'
require_relative 'undirected_unwieghted'
require_relative 'edge'

class TSP_GREED
  attr_accessor :graph

  def initialize(graph)
    @graph = graph
    @distance = []
  end



end

=begin
  data = open('graph.txt').read.split("\n")
  graph = UndirectedGraph.new
    data.each do |strdata|
      strdata = strdata.split(" ")
      v1 = Vertex.new(strdata[0], 0) # We don't want our vertex to have a weight
      v2 = Vertex.new(strdata[1], 0) # Same here
    edge = Edge.new(v1, v2, strdata[2].to_f)
  graph.add_edge(edge)
end

graph.edges.each do |edge|
  p edge
end
=end
