require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width= width
    self.height = height
    @matrix = Array.new
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x] = []
    @matrix[x][y] = pixel
  end

  def at(x, y)
    if (inbounds(x, y))
	  		return nil
	  	else
	     	@matrix[x][y]
	    end
  end

  private

  def inbounds(x, y)
    (x < 0 || y < 0)
  end

end
