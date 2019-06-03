require_relative 'tile'
# require 'colorize'

class Board
  
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
  end

  def from_file
    File.readlines('./puzzles/sudoku1.txt')
    # File.readlines('./puzzles/sudoku1_almost.txt')
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
      return true
    end    
  end

  def render
    system 'clear'
    puts
    puts "   0 1 2 3 4 5 6 7 8".light_black
    puts "  #{'-' * 19}".light_cyan
    (0...9).each do |row|
      print row.to_s.light_black + ' '

      (0...9).each do |col|
        print " #{@grid[row][col]}"
      end
      puts
    end
    puts "  #{'-' * 19}".light_cyan
  end

  def solved?
    if grid.flatten.none?(nil)
      rows = grid.map { |row| row.map(&:value) }
      columns = rows.transpose
      blocks = to_blocks(rows)
      all_numbers?(rows) && all_numbers?(columns) && all_numbers?(blocks)
    end
  end

  def to_blocks(rows)
    r_st, r_end, c_st, c_end = 0, 2, 0, 2
    blocks, block = [], []
    3.times do 
      rows.each_with_index do |row, idx|
        (c_st..c_end).each do |col|
          block << row[col]
        end
        if idx == 2 || idx == 5 || idx == 8
          blocks << block
          block = []
        end
      end
      c_st += 3
      c_end += 3

    end
    blocks
  end
  
  def all_numbers?(array_2d)
    array_2d.all? { |array| uniq_nums?(array) }
  end

  def uniq_nums?(numbers)
    (1..9).all? { |num| numbers.include?(num) }
  end

end