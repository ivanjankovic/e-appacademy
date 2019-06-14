require_relative 'player'
require 'colorize'
require 'byebug'

class Game

  attr_reader :dictionary, :fragment, :letters, :players, :activ_players
  attr_accessor :char, :activ

  def initialize(*args)
    @fragment = ''
    @dictionary = create_dictionary('./dictionary.txt')
    @players = args
    @activ_players = args
    @char = ''
    @letters = []
    @compleated = []
    @activ = true
  end

  ### ----- Main Logic ----- ###

  def run
    display_wellcome
    play_round while activ
    display_game_over
  end

  def play_round
    players.each { |player| take_turn(player) if player.score < 5 && self.activ }
  end

  def take_turn(player)
    @current_player = player
    available_letters
    display_score
    display_turn_info

    until valid_play?
      print "Enter a letter form the list: "
      @char = gets.chomp
    end
    
    @fragment += @char
    @char = ''
    update_dictionary
    word_comlete if dictionary.empty?
  end

  def word_comlete
    display_word_complete

    #update compleated words, fragment and dictionary
    @compleated << @fragment
    @fragment = ''
    @dictionary = create_dictionary('./dictionary.txt')

    #update player status
    @current_player.score += 1
    
    # game over if one_player activ left
    self.activ = false if activ_players.one?
  end

  ### ----- Helper Methods ----- ###

  def create_dictionary(file)
    Set.new File.readlines(file).map(&:chomp)
  end

  def activ_players
    @players.select { |player| player.score < 5 }
  end

  # posilble letters for the next turn
  def available_letters
    @letters = @dictionary.map { |word| word[fragment.length] }.uniq.to_a
  end

  # minimazise dictionar to words that only that start with curent fragment
  def update_dictionary
    dictionary.select! { |word| @fragment == word[0...fragment.length] && word.length > fragment.length }
  end

  def valid_play?
    alphabet = ('a'..'z').to_a
    char.length == 1 && alphabet.include?(@char) && @letters.include?(@char) ? true : false
  end
  
  def the_winner?
    players.select { |player| player.score < 5 }
  end

  def ghost_score(player)
    'GHOST'[0...player.score]
  end

  ### ----- Display Message ----- ###

  def display_wellcome
    system "clear"
    puts "Let's Start This Game!"
    sleep 2
  end

  def display_score
    puts "-" * 68
    puts
    puts "Compleated words: #{@compleated.to_a.join(' ').upcase.light_green}"
    players.each do |player|
      print "#{player.name}'s progres: #{ghost_score(player).light_blue} "
    end
    puts
    puts
  end

  def display_turn_info
    system "clear"
    display_score
    puts
    puts "#{'-' * 27} #{@current_player.name} Playing #{'-' * 27}".light_cyan
    puts
    puts "Posible letters: #{@letters.to_a.join(' ').upcase.light_blue}"
    puts "Number of potental words: #{@dictionary.length.to_s.light_blue}"
    puts "Current fragment: #{@fragment.upcase.light_blue}"
  end

  def display_word_complete
    system "clear"
    display_score
    puts
    puts "#{'-' * 26} Word Complited #{'-' * 26}".light_green
    puts
    puts "Congratulations #{@current_player.name.upcase.light_cyan}!!!"
    puts "You complited a word #{fragment.upcase.light_green} and EARND a letter!"
    puts
    puts ('-' * 68).light_green
    sleep(5)
  end

  def display_game_over
    system "clear"
    display_score
    puts
    puts "#{'-' * 28} Game Over #{'-' * 29}".light_magenta
    puts
    puts "#{' '*15} Game complete, #{the_winner?[0].name.upcase.light_cyan} is the winner!!!"
    puts
    puts ('-' * 68).light_magenta
    puts
  end

end 

game = Game.new(Player.new('Sima'), Player.new('Pera'), Player.new('Vasa'))
