class MinBinaryHeap
  attr_accessor :heap

  def initialize
    @heap = Array.new
  end

  def insert(data)
	   @heap.push(data)
	   node = @heap.index(data)
	   sift_up(node)
  end

   def sift_up(child)
	   if child != 0
		     parent = get_parent(child)
		     if @heap[parent][1] > @heap[child][1]
			      @heap[parent], @heap[child] = @heap[child], @heap[parent]
			      sift_up(parent)
		     end
	    end
   end

   def get_parent(index)
 	   ((index-1)/2).floor
   end

   def delete(data)
     	el = find(data)
     	if el == @heap[-1][0]
     		@heap.pop
        return @heap
     	else
  	   	@heap[el], @heap[-1] = @heap[-1], @heap[el]
  	   	@heap.pop
  	   	min_heapify(el)
  	  end
   end

   def min_heapify(i)
	    left = 2*i + 1
	    right =  2*i + 2
	    smallest = i

	    if left < @heap.length && @heap[left][0] < @heap[smallest][0]
		      smallest = left
	    elsif right < @heap.length && @heap[right][0] < @heap[smallest][0]
		      smallest = right
	    end

      if smallest != i
		      @heap[i], @heap[smallest] = @heap[smallest], @heap[i]
		      min_heapify(smallest)
	    end
    end

    def find(data)
      @heap.each_with_index do |element, index|
      	 if element[0] == data
      	 	return index
      	 end
      end
    end

    def show_parent(data)
    	@heap.each_with_index do |element, index|
     	if element[0] == data
       	 	return  "parent: #{element}"
         end
      end
    end

    def show_children(data)
    		@heap.each_with_index do |element, index|
    			if element[0] == data
    				if !@heap[index*2+1] && !@heap[index*2 + 2]
    					return "#{element} is leaf"
    				elsif !@heap[index*2+1]
    					return "right: #{@heap[index*2+2]}"
    				elsif !@heap[index*2+2]
    					return "left: #{@heap[index*2+1]}"
    				else
    					return "left: #{@heap[index*2+1]}, right: #{@heap[index*2+2]}"
    				end
    			end
    		end
    end

    def printf
    	@heap.each do |element|
    		puts "#{element[0]}: #{element[1]}"
    	end
    end

end
