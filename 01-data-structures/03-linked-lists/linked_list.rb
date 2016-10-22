class LinkedList < Node

  def initialize
    @next = @prev = self
  end

  def head
    @next unless @next == self
  end

  def tail
    @prev unless @prev == self
  end

  def add_to_tail(node)
    node.insert_after(self.prev)
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
  	tail.remove
  end

  # This method prints out a representation of the list.
  def each(&block)
    return enum_for(:each) unless block_given?
    node = @next
    while node != self
      yield node
      node = node.next
    end
  end

  def length
    ary = each.collect {|node| node.data }
    puts ary.length
  end

  def print
    array = each.collect {|node| node.data }
    $stdout.puts array.join("\n")
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    node.remove
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
     node.insert_after(self)
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    return @next if @next == self
    head.remove
  end

  def remove_by_val(data)
  	node = @next
  	while node != nil && node.data != data
	  	node = node.next
	  end
	  node.remove
  end

  def find_by_val(data)
    node = @next
  	while node != nil && node.data != data
      node = node.next
	  end
	    return node.data
  end


end
