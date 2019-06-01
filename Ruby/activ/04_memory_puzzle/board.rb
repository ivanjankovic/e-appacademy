require_relative './card.rb'

class Board

  attr_accessor :grid, :cards

  def initialize
    @grid = Array.new(4) {Array.new(4)}
  end 

  def populate
    cards = []
    2.times do
      [:A, :E, :I, :Q, :U, :P, :L, :T ].shuffle.each do |value|
        cards << Card.new(value)
      end
    end
    (0...4).each do |row|
      (0...4).each do |col|
        k = row * 4 + col
        grid[row][col] = cards[k]
      end
    end
  end

  def render
    system "clear"
    puts ''
    puts '  0 1 2 3'
    (0...4).each do |row|
      print row
      (0...4).each do |col|
        card = grid[row][col]
        print " #{card.to_s}"
      end
      puts ''
    end
    puts ''
  end

  def won?
    grid.flatten.all? { |card| card.face_up }
  end

  def reveal(guessed_pos) #guessed_pos [0,0]
    row, col = guessed_pos
    card = grid[row][col]
    card.reveal
    card.value
  end

end