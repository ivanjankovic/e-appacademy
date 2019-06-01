require_relative './board'
require 'byebug'
class Game

  attr_reader :board, :guesses

  def initialize
    @board = Board.new
    @guesses = []
  end

  def play
    board.populate

    while !board.won?
      board.render
      round
      guesses.clear
      sleep 2
    end

    puts
    puts "Congaturaltion You Won!!! You have found all pairs." 
  end

  def round
    2.times do
      guess
      board.render
    end
    
    if compare(guesses)
      puts "It's a match!"
    else
      puts "Try again."
      guesses.each { |card| card.hide }
    end
  end

  def guess
    card, row, col, guess_valid = nil,nil,nil,nil

    until guess_valid
      puts "Please enter the position of the card you like to flip."
      pos = gets.chomp

      if pos.length != 3 || pos[1] != ',' 
        error("Your input should be two single digits and comma ',' between them.", pos)
      else
        row, col = pos[0].to_i, pos[-1].to_i

        if row > 3 || col > 3
          error("Try agine, numbers options are 0, 1, 2 and 3",pos)
        else
          card = board.grid[row][col]

          if card.face_up == true
            error("Card already flipped!!! Chose another card.",pos)
          else
            guess_valid = true
          end
        end
      end

    end

    card.reveal
    guesses << card
  end

  def error(message, pos)
    board.render
    puts "You enterd #{pos}"
    puts message
  end

  def compare(guesses)
    guesses[0].value == guesses[1].value
  end

end

game = Game.new
game.play