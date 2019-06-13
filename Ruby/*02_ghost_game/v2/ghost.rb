require_relative 'player'
require 'colorize'
require 'byebug'


class Game

  attr_reader :dictionary, :fragment, :letters, :players
  attr_accessor :char

  def initialize(*args)
    @fragment = ''
    @dictionary = create_dictionary('./dictionary.txt')
    @players = args
    @char = ''
    @letters = Hash.new(0)
  end

  def run
    display_wellcome
    
    while activ_players.length > 1
      play_round
    end
    display_game_over
  end

  def play_round
    activ_players.each do |player|
      
      if !round_over?
        @current_player = player
        available_letters
        @char = ''
        take_turn
      else
        display_word_complete

        #update curent player score and activ properties
        @current_player.score += 1
        @current_player.activ = false if @current_player.score == 5
        
        # reset fragment and dictionary
        @fragment = ''
        @dictionary = create_dictionary('./dictionary.txt')
        sleep(5)
      end
    end
  end


  def create_dictionary(file)
    Set.new File.readlines(file).map(&:chomp)
  end

  def activ_players
    @players.select { |p| p.activ }
  end

  def display_wellcome
    puts "Let's Start This Game!"
    sleep 2
  end

  # posilble letters for the next turn
  def available_letters
    @dictionary.map do |word|
      letter = word[fragment.length]
      letters[letter] += 1
    end
  end

  def display_game_over
    puts
    puts '---------------- Game Over ----------------'.light_magenta
    puts
    puts "Only ONE player left, #{the_winner?[0].name.upcase.light_magenta} is the winner!!!"
    puts
    puts ('-' * 43).light_magenta
    puts
  end

  

  

  def take_turn
    return if activ_players.length < 2
    display_score
    display_turn_info

    until valid_play?
      print "Enter a letter form the list: "
      @char = gets.chomp
    end
    
    @fragment += @char
    update_dictionary
    round_over?
  end

  def round_over?
    dictionary.empty?
  end

  def display_turn_info
    puts
    puts "------ #{@current_player.name} Playing ------".light_cyan
    puts
    puts "Posible letters: #{@letters.keys.join(' ').upcase.light_blue}"
    puts "Number of potental words: #{@dictionary.length.to_s.light_blue}"
    puts "Current fragment: #{@fragment.upcase.light_blue}"
  end

  def display_score
    system "clear"
    players.each do |player|
      puts "Player #{player.name}'s' score is  #{ghost_score(player).light_blue}"
    end
  end

  def display_word_complete
    puts
    puts '----- Word Complited -----'.light_green
    puts
    puts "Congratulations #{@current_player.name.upcase.light_blue}!!!"
    puts "You complited a word #{fragment.upcase.light_green} and EARND a letter!"
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

end 

game = Game.new(Player.new('Sima'), Player.new('Pera'), Player.new('Vasa'))
