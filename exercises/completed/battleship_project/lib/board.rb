class Board

  attr_reader :size, :grid

  def self.print_grid(arr) #2d
    arr.each do |row|
      puts row.join(' ')
    end
  end

  def initialize(n)
    @grid = Array.new(n,:N) { Array.new(n, :N) }
    @size = (n * n)
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
    # count = 0
    # @grid.each do |row|
    #   row.each { |ele| count += 1 if ele == :S }
    # end

    # count
  end

  ###   PART 2   ###

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts 'you sunk my battleship!'
      true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    n = @grid.length

    while self.num_ships < @size / 4
      pos = [rand(0...n), rand(0...n)]
      self[pos] = :S
    end

  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele  == :S
          :N
        else
          ele
        end
      end
    end  
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
