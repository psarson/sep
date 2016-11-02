require_relative 'hash_item'

class HashClass
  attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    ind = convert(key)
    sub_array = Array.new(2)
    sub_array.replace([key, value])
      @items.each_with_index do |el, index|
    		if  ind == index &&  el == nil || el == sub_array
    			@items.delete_at(ind)
			    @items.insert(ind, sub_array)
    		elsif ind == index && el != nil
          re_assign(ind)
          @items.delete_at(ind)
			    @items.insert(ind, sub_array)
    		end
  	end
  end

  def convert(string)
  	string.split('').map(&:ord).inject(:+) % size
  end

  def check(array, key)
  	dupe = array.dup
  	dupe.map! do |value|
  		convert(value.first)
  	end
  	dupe.flatten.any? {|num| num == key}
  end

  def get_non_nil
  	old_index = Array.new
  	@items.each do |el|
  		if el != nil
  			old_index.push(el)
  		end
  	end
  	return old_index
  end

  def re_assign(key)
    get_non_nil
  	until check(get_non_nil, key) == false
  		@items.concat(Array.new(@items.length))
  	end
  	get_non_nil.each_with_index do |value|
  		i = value.first.split('').map(&:ord).inject(:+) % size
  		@items.delete_at(i)
  		@items.insert(i, value)
	  end
  end

  def [](key)
    @items[key.split('').map(&:ord).inject(:+) % size][1]
  end

  def resize
   get_non_nil

   @items.concat(Array.new(@items.length))

   get_non_nil.each_with_index do |value|
  	 i = value.first.split('').map(&:ord).inject(:+) % size
  	 @items.delete_at(i)
  	 @items.insert(i, value)
   end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
	  key.split('').map(&:ord).inject(:+) % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
