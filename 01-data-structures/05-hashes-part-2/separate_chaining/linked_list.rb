require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = head
    @tail = tail
  end


  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
     @head = node
     @tail = node
    else
     @tail.next = node
     @tail = node
   end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    if current == @tail
      @tail = nil
    else
      while current.next != nil && current.next != @tail
        current = current.next
      end
      @tail = current
      current.next = nil
    end
  end

  # This method prints out a representation of the list.
  def each(&block)
    return enum_for(:each) unless block_given?
    current = @head
    until current == nil
      yield current
      current = current.next
    end
  end

  def print
    array = each.collect {|node| node.key}
    $stdout.puts array.join("\n")
  end
  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head
    if current == node
      @head = current.next
    elsif node == @tail
      remove_tail
    else
      while current.next != nil && current.next != node
        current = current.next
      end

      if (current != nil) && (current.next != nil)
        current.next = current.next.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == nil
      return nil
    elsif @head == @tail
      @head = nil
    else
      old_head = @head
      new_head = @head.next
      @head = new_head
    end
  end

end
