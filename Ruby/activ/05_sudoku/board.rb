require_relative './tile'

class Board
  
  def initialize
    @board = Array.new(9) { Array.new(9) }
  end

  def from_file
    File.readlines('./puzzles/sudoku1.txt')
  end

  def populate
    (0...9).each do |row|
      (0...9).each do |col|
        value = self.from_file[row][col]
        @board[row][col] = Tile.new(value, true) if value != '0'
      end
    end
  end

  def display
    puts '-' * 19
    (0...9).each do |row|
      (0...9).each do |col|
        print " #{@board[row][col]}"
      end
      puts
    end
    puts '-' * 19
  end

end