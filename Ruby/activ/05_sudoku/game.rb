require_relative 'board'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    @board.populate
    until sovled
    @board.render
    puts "Please input position and number you would like to place"
    print "Position: "
    pos = gets.chomp
    print "Number: "
    num = gets.chomp
    
    end
  end

end

game = Game.new
