require './lib/cell'
require './lib/dead_cell'
require './lib/alive_cell'

class World
  def initialize(width, height)
    @cells = []
    height.times do |x|
      @cells << []
      width.times do |y|
        cell = DeadCell.new(self, x, y)
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

  def toggle(cell)
    @cells[cell.x][cell.y] = cell.toggle
  end

  def tick
    cells.each { |cell| toggle(cell) }
  end
end
