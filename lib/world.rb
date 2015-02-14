require './lib/cell'

class World
  def initialize(width, height)
    @cells = []
    height.times do |x|
      @cells << []
      width.times do |y|
        cell = Cell.new(self, x, y)
        @cells[x] << cell
      end
    end
  end

  def cells
    @cells.flatten
  end

  def cell_at(x, y)
    @cells[x][y] if @cells[x]
  end

  def next_generation!
    alive_cells.select { |cell| cell.alive_neighbours.length < 2 }.each(&:toggle)
  end

  private

  def alive_cells
    cells.select(&:alive?)
  end
end
