class Node
  attr_reader :name, :nieghbors

  def initialize(name)
    @name = name
    @nieghbors = []
  end
end
