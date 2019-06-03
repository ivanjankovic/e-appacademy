require_relative 'board'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    @board.populate
    @board.render
    until @board.solved?
      puts
      puts "Please input position and number you would like to place."
      print "Select row: "
      row = validate(gets)
      print "Select column: "
      col = validate(gets)
      print "Number: "
      num = validate(gets)
      @board.set_value([row, col], num)
      sleep 1
      @board.render
    end
    puts
    puts "Congratulatio, you solved sudoku!!!".light_yellow
    puts
  end

  def validate(gets)
    input = gets.chomp
    # exit game from anytime by typing in q || quit
    if input == 'q' || input == 'quit'
      puts "\n- exiting game -\n".light_red
      sleep 2
      exit
    else
      input.to_i
    end
  end

end

# future upgrade: display how may coloms rows and blocks have been solved , wich requred modification of solved method to track count as well as render methot to print out those results
