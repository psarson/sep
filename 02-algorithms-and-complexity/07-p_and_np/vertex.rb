class Vertex
  include Comparable

  attr_accessor :weight
  attr_reader :id

  def initialize(id, weight = 0)
    @id = id
    @weight = weight
  end

  def <=>(other)
    @id<=>other.id
  end

  def hash
    @id.hash
  end

  def eql?(other)
    hash == other.hash
  end

end
