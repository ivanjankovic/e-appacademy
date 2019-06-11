require_relative 'player'
require 'byebug'

class Game

  attr_reader :dictionary, :fragment
  attr_accessor :char

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
    @fragment += @char
    @char = ''
    update_dictionary
  end
  
  def update_dictionary
    dictionary.select! { |word| @fragment == word[0...fragment.length] }
  end

  def valid_play?
    alphabet = ('a'..'z').to_a

    alphabet.include?(@char) &&
      dictionary.any? { |word| @char == word[fragment.length] } ? true : false
  end
  
end

player1 = Player.new('Sima')
player2 = Player.new('Pera')

game = Game.new(player1, player2)
debugger