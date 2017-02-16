class Edge
  include Comparable

  attr_reader :weight, :from, :to

  def initialize(from, to, weight)
    @from = from
    @to = to
    @weight = weight
  end

  def either
    @from
  end

  def other(vertex)
    (vertex == @from) ? @to : @from
  end

  def <=>(edge)
    @weight<=>edge.weight
  end

end 
