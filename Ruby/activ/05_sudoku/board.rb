require_relative 'tile'
require 'colorize'

class Board
  
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
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
          @grid[row][col] = Tile.new(nil, false)
        else
          @grid[row][col] = Tile.new(value, true)
        end 
      end
    end
  end

  def set_value(pos, value)
    row, col = pos
  
    if @grid[row][col].from_file
      return false
    else
      @grid[row][col].value = value
      puts "Value updated".red
      return true
    end    
  end

  def render
    puts '-' * 19
    (0...9).each do |row|
      (0...9).each do |col|
        print " #{@grid[row][col]}"
      end
      puts
    end
    puts '-' * 19
  end

  def solved?
    if @grid.flatten.none?(nil)
      puts "board filled".red
      rows = @grid
      cols = @grid.transpose
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