class Node
  attr_accessor :next, :prev, :data

  def initialize(data)
    @data = data
  end

  def remove
    @prev.next = @next if @prev
    @next.prev = @prev if @next
    @next = @prev = nil
  end

  def insert_after(node)
    remove

    @next = node.next
    @next.prev = self if @next
    @prev = node
    node.next = self
  end
end
