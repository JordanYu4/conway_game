# Any live cell with fewer than two live neighbors dies, 
#   as if by underpopulation.
# Any live cell with two or three live neighbors lives on 
#   to the next generation.
# Any live cell with more than three live neighbors dies, 
#   as if by overpopulation.
# Any dead cell with exactly three live neighbors becomes 
#   a live cell, as if by reproduction.

class Cell 

  attr_reader :active 
  attr_accessor :num_neighbors

  def initialize 
    @active = false
    @num_neighbors = nil
  end

  def sleep 
    @active = false
  end

  def animate 
    @active = true
  end

  def active?
    @active
  end

  # def num_neighbors 
  # end

  # def next_state
  #   count = @num_neighbors 
  #   if count < 2 
  #     self.sleep
  #   elsif count < 4
  #     self.animate unless @active 
  #   else
  #     self.sleep 
  #   end
  # end
  
  private

  attr_writer :alive

end