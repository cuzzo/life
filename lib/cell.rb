class Cell
  attr_reader :world, :x, :y

  def initialize(world, x, y)
    @world, @x, @y = world, x, y
  end

  def dead?
    true
  end

  def neighbours
    neighbours_coordinates.map { |x, y| world.cell_at(x, y) } - [self]
  end

  private

  def neighbours_coordinates
    [x - 1, x, x + 1].product([y - 1, y, y + 1])
  end
end
