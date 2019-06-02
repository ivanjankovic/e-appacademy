require_relative './tile'
require 'colorize'

class Board
  
  attr_reader :board

  def initialize
    @board = Array.new(9) { Array.new(9) }
  end

  def from_file
    File.readlines('./puzzles/sudoku1.txt')
    # File.readlines('./puzzles/sudoku1_solved.txt')
  end

  def populate
    (0...9).each do |row|
      (0...9).each do |col|
        value = self.from_file[row][col].to_i
        if value == 0
          @board[row][col] = Tile.new(nil, false)
        else
          @board[row][col] = Tile.new(value, true)
        end 
      end
    end
  end

  def set_value(pos, value)
    row, col = pos
  
    if @board[row][col].from_file
      return false
    else
      @board[row][col].value = value
      puts "Value updated".red
      return true
    end    
  end

  def render
    puts '-' * 19
    (0...9).each do |row|
      (0...9).each do |col|
        print " #{@board[row][col]}"
      end
      puts
    end
    puts '-' * 19
  end

  def solved?
    if @board.flatten.none?(nil)
      puts "board filled".red
      rows = @board
      cols = @board.transpose
      all_numbers?(rows) #&& all_numbers?(cols)
    end
  end

  def all_numbers?(array)
    array.all? do |sub_array|
      values = sub_array.map { |tile| tile.value }
      (1..9).all? { |num| values.include?(num) }
    end
  end

end

board = Board.new
board.populate
board.render