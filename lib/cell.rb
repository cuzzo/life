class Cell
  attr_reader :world, :x, :y

  def initialize(world, x, y)
    @world, @x, @y = world, x, y
  end

  def neighbours
    neighbours_coordinates.map { |x, y| world.cell_at(x, y) }.compact
  end

  def alive_neighbour_count
    neighbours.select { |cell| cell.is_a?(AliveCell) }.length
  end

  def neighbours_coordinates
    coordinates = [x - 1, x, x + 1].product([y - 1, y, y + 1])
    coordinates.delete([x, y])
    coordinates
  end
end
