require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    ind = convert(key)
  	sub_array = Array.new(2)
  	sub_array.replace([key, value])
      @items.each_with_index do |val, index|
       if  ind == index &&  val == nil || val == sub_array
         @items.delete_at(ind)
         @items.insert(ind, sub_array)
       elsif ind == index && val != nil
         insert_at_next(sub_array)
       end
      end
  end

  def convert(string)
  	string.split('').map(&:ord).inject(:+) % size
  end

  def insert_at_next(element)
    if !@items.any? {|n_val| n_val == nil}
        resize
        index = find_nil
        @items.delete_at(index)
        @items.insert(index, element)
    else
        index = find_nil
        @items.delete_at(index)
        @items.insert(index, element)
    end
  end

  def [](key)
    @items.each_with_index do |el, i|
	  	if el.is_a?(Array)
	  		return el[1] if el[0] == key
	  	end
	  end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.split('').map(&:ord).inject(:+) % size
  end

  # Given an index, find the next open index in @items
  def find_nil
  	@items.each_with_index do |el, i|
        if el == nil
          return i
        end
    end
  end

  def next_open_index(index)
    if !@items.any? {|n_val| n_val == nil}
		    -1
	  else
    	find_nil
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def get_non_nil
  	old_index = Array.new
  	@items.each do |el|
  		if el != nil
  			old_index.push(el)
  		end
  	end
  	return old_index
  end

  def resize
    get_non_nil
    @items.concat(Array.new(size))
    prev_size =  size * 0.5

    get_non_nil.each_with_index do |value|
  		i = value.first.split('').map(&:ord).inject(:+) % size
      j = value.first.split('').map(&:ord).inject(:+) % prev_size.floor
      @items.delete_at(j)
      @items.insert(j, nil)
		  @items.delete_at(i)
		  @items.insert(i, value)
	  end
  end


end
