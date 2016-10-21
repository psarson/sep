class MyStack
  attr_accessor :top
  attr_accessor :stack

  def initialize
    self.stack = Array.new
    self.top = nil
  end

  def push(item)
    self.stack.unshift(item)
    self.top = @stack[0]
  end

  def pop
    popped = self.stack.slice!(0)
    self.top = @stack[0]
    return popped
  end

  def empty?
    self.stack.length <=  0
  end

end
