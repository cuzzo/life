class DeadCell < Cell
  def toggle
    ready_to_reproduce? ? AliveCell.new(@world, @x, @y) : self
  end

  private

  def ready_to_reproduce?
    alive_neighbour_count == 3
  end
end
