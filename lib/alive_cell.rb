class AliveCell < Cell
  def toggle
   if alive_neighbour_count < 2 || alive_neighbour_count > 3
     DeadCell.new(@world, @x, @y)
   else
     self
   end
  end
end
