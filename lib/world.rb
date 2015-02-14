require './lib/cell'

class World
  def initialize(width, height)
    @cells = []
    height.times do |x|
      width.times do |y|
        @cells << Cell.new
      end
    end
  end

  def cells
    @cells
  end
end
