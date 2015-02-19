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

  def tick
    to_toggle = alive.select { |cell| !cell.alive_neighbour_count.between?(2, 3) }
    to_toggle += dead.select { |cell| cell.alive_neighbour_count == 3 }
    to_toggle.each(&:toggle)
  end

  private

  def alive
    cells.select(&:alive?)
  end

  def dead
    cells.select(&:dead?)
  end
end
