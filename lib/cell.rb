class Cell
  attr_reader :world, :x, :y

  def initialize(world, x, y)
    @world, @x, @y = world, x, y
    @dead = true
  end

  def dead?
    @dead
  end

  def alive?
    !@dead
  end

  def toggle
    @dead = !@dead
  end

  def neighbours
    neighbours_coordinates.map { |x, y| world.cell_at(x, y) }.compact - [self]
  end

  def underpopulated?
    alive_neighbour_count < 2
  end

  def overcrowded?
    alive_neighbour_count > 3
  end

  def reproduce?
    alive_neighbour_count == 3
  end

  private

  def alive_neighbour_count
    neighbours.select(&:alive?).length
  end

  def neighbours_coordinates
    [x - 1, x, x + 1].product([y - 1, y, y + 1])
  end
end
