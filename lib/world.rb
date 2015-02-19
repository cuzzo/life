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
    to_toggle = alive_cells.select do |cell|
      cell.alive_neighbours.length < 2 || cell.alive_neighbours.length > 3
    end

    to_toggle += dead_cells.select do |cell|
      cell.alive_neighbours.length == 3
    end

    to_toggle.each(&:toggle)
  end

  private

  def alive_cells
    cells.select(&:alive?)
  end

  def dead_cells
    cells.select(&:dead?)
  end
end
