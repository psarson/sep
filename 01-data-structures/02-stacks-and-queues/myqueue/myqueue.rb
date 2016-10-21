class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = ""
    @tail = ""
  end

  def enqueue(element)
    @queue.unshift(element)
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    if (!empty?)
      @queue.pop
    end
  end

  def empty?
    @queue.length <= 0
  end
end
