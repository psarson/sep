require_relative 'node'
require_relative 'graph'

class KevinBacon

  def initialize(graph, source_node)
    @graph = graph
    @node = source_node
    @visited = []
    @edge_to = {}
    @path = []
    breadth_first(source_node)
  end

  def shortest_path_to(node)
    return unless has_path_to?(node)

    while(node != @node) do
      @path.unshift(node)
      node = @edge_to[node]
    end

    @path.unshift(@node)

    print_array = []

    @path.each do |node|
      print_array << node.name
    end
    p print_array
  end

  def breadth_first(start_node)
      q = Array.new
      q << start_node
      @visited << start_node

        while !q.empty?
          current_node = q.shift
          current_node.nieghbors.each do |adjacent_node|
            next if @visited.include?(adjacent_node)
            q << adjacent_node
            @visited << adjacent_node
            @edge_to[adjacent_node] = current_node
            end
        end
  end

  def has_path_to?(node)
    @visited.include?(node)
  end
end
