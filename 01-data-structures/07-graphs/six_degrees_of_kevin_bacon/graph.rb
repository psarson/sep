require_relative 'node'

class Graph
  def add_edge(node_one, node_two)
    node_one.nieghbors << node_two
    node_two.nieghbors << node_one
  end

  def add_node(node, hash)
    hash.each do |key, value|
      if value.include? node
        value.delete(node)
        value.each do |val|
           add_edge(node, val)
        end
      end
    end
  end
end   
