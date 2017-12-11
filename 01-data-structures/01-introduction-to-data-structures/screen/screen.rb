require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = createDisplay(width, height)
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
    return @matrix
  end

  def createDisplay(w, h)
    display = []
    for i in 0..h do
      display.push(Array.new(w, 0))
    end
  end

  def at(x, y)
    return @matrix[x][y]
  end

  private

  def inbounds(x, y)
  end

end