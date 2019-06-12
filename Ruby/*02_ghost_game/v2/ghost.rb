require_relative 'player'
require 'colorize'
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

  def activ_players
    @players.select { |p| p.activ }
  end

  def run
    puts "Let's Start This Game!"
    
    while activ_players.length > 1
      play_round
    end
    puts
    puts '---------------- Game Over ----------------'.light_magenta
    puts
    puts "Only ONE player left, #{the_winner?[0].name.upcase.light_magenta} is the winner!!!"
    puts
    puts ('-' * 43).light_magenta
    puts

  end

  def play_round
    activ_players.each do |player|
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
    return if activ_players.length < 2
    system "clear"
    display_score
    puts
    puts "------ #{@current_player.name} Playing ------".light_cyan
    puts
    puts "Posible letters: #{@letters.keys.join(' ').upcase.light_blue}"
    puts "Number of potental words: #{@dictionary.length.to_s.light_blue}"
    puts "Current fragment: #{@fragment.upcase.light_blue}"

    until valid_play?
      print "Enter a letter form the list: "
      @char = gets.chomp
    end
    
    @fragment += @char
    update_dictionary
    if dictionary.empty?
      puts
      puts '----- Word Complited -----'.light_green
      puts
      puts "Congratulations #{@current_player.name.upcase.light_blue}!!!"
      puts "You complited a word #{fragment.upcase.light_green} and EARND a letter!"

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
      puts "Player #{player.name}'s' score is  #{ghost_score(player).light_blue}"
    end
  end

  def the_winner?
    players.select { |player| player.score < 5 }
  end

  def ghost_score(player)
    'GHOST'[0...player.score]
  end

end 

game = Game.new(Player.new('Sima'), Player.new('Pera'), Player.new('Vasa'))
