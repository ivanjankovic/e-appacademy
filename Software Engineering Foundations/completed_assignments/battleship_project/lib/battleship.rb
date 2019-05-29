require_relative "board"
require_relative "player"

class Battleship

  ###   PART 3   ###

  attr_reader :board, :player
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "Number of ships: #{@board.num_ships}"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'you lose'
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships == 0
      puts 'you win'
      true
    else
      false
    end
  end

  def game_over?
    self.lose? || self.win?
  end

  def turn
    move = @player.get_move
    @remaining_misses -= 1 if @board.attack(move) == false
    @board.print
    puts "Reamaining misses: #{@remaining_misses}"
  end

end
