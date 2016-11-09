require_relative 'node'
#require_relative 'linked_list'

class BinarySearchTree
  attr_accessor :root


  def initialize(root)
    @root = root
    @stack = Array.new
  end

  def insert(root, node)
    current = @root
    while current != nil
      if (node.rating < current.rating) && (current.left == nil)
        current.left = node
      elsif (current.rating < node.rating) && (current.right == nil)
        current.right = node
      elsif node.rating < current.rating
        current = current.left
      elsif node.rating > current.rating
        current = current.right
      else
        return
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data == nil
    if data == root.title
      return root
    elsif root.left != nil
      find(root.left, data)
    else
      find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if data == nil
    node = find(root, data)
    node.title = nil
  end

  # Recursive Breadth First Search
  def get_kids(data)
    kids = Array.new
      kids.push(data)
      kids.push(root.left) if root.left != nil
      kids.push(root.right) if root.left != nil
    p kids
  end

  def level_order(root=@root, &block)
    queue = Array.new
    queue << root
    until queue.empty?
      node = queue.shift
      $stdout.puts "#{node.title}: #{node.rating}"
        queue << node.left if node.left
        queue << node.right if node.right
      end
  end



  def printf(children=nil)
    level_order
  end




end
