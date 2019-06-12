require_relative 'player'
require 'byebug'

class Game

  attr_reader :dictionary, :fragment, :letters, :players
  attr_accessor :char

  def initialize(*args)
    @fragment = ''
    @char = ''
    @dictionary = create_dictionary('./dictionary.txt')
    @letters = available_letters
    @players = args
  end

  def create_dictionary(file)
    Set.new File.readlines(file).map(&:chomp)
  end

  # posilble letters for the next turn
  def available_letters
    letters = Hash.new(0)

    @dictionary.map do |word|
      letter = word[fragment.length]
      letters[letter] += 1
    end

    letters
  end

  def run
    puts "Let's Start This Game!"
    # play while there is more than any player with activ value set to true
    while @players.any? { |p| p.activ }
      play_round
    end
    puts
    puts '----- Game Over -----'
    puts
    puts "Only ONE player left, #{the_winner?[0].name} is the winner!!!"

  end

  def play_round

    @players.select { |p| p.activ }.each do |player|
        @current_player = player
        @letters = available_letters
        @char = ''
        take_turn
        next_player!
    end
    
  end

  def next_player!
    @previous_player = @current_player
  end

  def take_turn
    
    # system "clear"
    display_score
    puts
    puts "List of posible letters: #{@letters.keys.join}"
    puts "Number of posible words: #{@dictionary.length}"
    puts "Wating for #{@current_player.name}'s next move."
    puts "Current fragment: #{@fragment}"

    until valid_play?
      print "Enter a letter form the list: "
      @char = gets.chomp
    end
    
    @fragment += @char
    update_dictionary
    if dictionary.empty?
      puts
      puts '----- Round Over -----'
      puts
      puts "Congratulations #{@current_player.name}!!!"
      puts "You complited a word #{fragment.upcase} and EARND a letter!"

      #update curent player score and activ properties
      @current_player.score += 1
      @current_player.activ = false if @current_player.score == 5

      # reset fragment and dictionary
      @fragment = ''
      @dictionary = create_dictionary('./dictionary.txt')
      sleep(4)
    end
  end

  # minimazise dictionar to words that only that start with curent fragment
  def update_dictionary
    dictionary.select! { |word| @fragment == word[0...fragment.length] && word.length > fragment.length }
  end

  def valid_play?
    alphabet = ('a'..'z').to_a
    char.length == 1 && alphabet.include?(@char) && @letters.include?(@char) ? true : false
  end
  
  def display_score
    players.each do |player|
      puts "PLayer #{player.name}'s' score is #{player.score}"
    end
  end

  def the_winner?
    players.select { |player| player.score < 5 }
  end

  # def record(player)
  #   'GHOST'[0...@losses.player]
  # end

end 

game = Game.new(Player.new('Sima'), Player.new('Pera'), Player.new('Vasa'))
