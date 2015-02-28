require './lib/cell'
require './lib/dead_cell'
require './lib/alive_cell'

class World
  def initialize
    @cells = []
  end

  def <<(cell)
    @cells << cell
  end

  def cell_at(x, y)
    @cells.find { |cell| cell.x == x && cell.y == y }
  end

  def tick
    @cells = @cells.map(&:toggle)
  end
end
