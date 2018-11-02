require_relative 'grid'

class Game 

  def initialize(size=nil)
    @grid = Grid.new(size)
  end

  def take_turn 
    @grid.step
    @grid.render
    sleep(1)
    print "\e[H\e[2J" # given by Andrew 
  end

  def play
    while true 
      take_turn 
    end
  end  

end

new_game = Game.new(9)
new_game.play