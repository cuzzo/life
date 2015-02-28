class AliveCell < Cell
  def toggle
    transition? ? DeadCell.new(@world, @x, @y) : self
  end

  private

  def transition?
    alive_neighbour_count < 2 || alive_neighbour_count > 3
  end
end
