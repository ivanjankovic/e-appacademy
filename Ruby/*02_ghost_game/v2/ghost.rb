
require 'byebug'

class Game

  def initialize(*args)
    @fragment = ''
    @dictionary = create_dictionary('./dictionary.txt')
    @players = args
  end

  def create_dictionary(file)
    Set.new File.readlines(file).map(&:chomp)
  end

  def play_round

  end
  
  def valid_play?
  
  end
end

player1 = 'Player.new'
player2 = 'Player.new'
game = Game.new(player1, player2)