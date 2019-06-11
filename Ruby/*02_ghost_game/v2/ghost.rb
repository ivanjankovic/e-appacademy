
require 'byebug'

class Game

  attr_reader :dictionary, :fragment

  def initialize(*args)
    @fragment = ''
    @char = ''
    @dictionary = create_dictionary('./dictionary.txt')
    @players = args
  end

  def create_dictionary(file)
    Set.new File.readlines(file).map(&:chomp)
  end

  def play_round
    # @temp_dict = Set.new
  end

  def take_turn
    until valid_play?
      print 'input a letter: '
      @char = gets.chomp
    end
  end
  
  def valid_play?
    alphabet = ('a'..'z').to_a
    
    false if !alphabet.include?(@char)
    false if !dictionary.any? { |word| @char == word[fragment.length] }
    true
  end
  
end

player1 = Player.new('Sima')
player2 = Player.new('Pera')

game = Game.new(player1, player2)
debugger