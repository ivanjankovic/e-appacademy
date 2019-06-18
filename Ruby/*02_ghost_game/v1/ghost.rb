require 'byebug'
require_relative './player.rb'

class Game

  def initialize
    @players = []
    @fragment = ''
    @dictionary = {}
    @current_player = nil
    @error = nil
    @errors = {
      'legth'=> 'You should enter a single letter, try again.',
      'not letter'=> 'Your selection is not a letter of alphabet, try again.',
      'invalid word'=> 'Adding that letter would result in invalid word, try again.'
    }
    @round_over = false
    @game_over = false

    File.open('dictionary.txt') do |file|
      file.each_line do |line|
        @dictionary[line.chomp] = true
      end
    end
  end


  ###     Variables     ###

  def dummie_players
    @players = ['Marko', 'Pera'].map { |name| Player.new(name) }
  end

  def set_players
    puts 'Welcome, type the number of players.'
    players_num = gets.chomp.to_i
    players_num = default_p.length
    players_num.times do |i|
      puts "Pease enter player's #{i+1} name."
      name = gets.chomp
      @players << Player.new(name)
    end
  end


  ###     Display     ###

  def display_stats
    puts
    puts '-----------------------------------------------'
    @players.each { |pl| puts "#{pl.name}'s score: #{ to_letter(pl.score) if pl.score != 0 }" }
    puts 
    puts "Fragment: #{@fragment}"
    puts "Current player is: #{@current_player.name if !@current_player.nil?}"
    puts '-----------------------------------------------'
    puts ''
  end

  def display_message(player)
    #display errors if any
    puts "#{@errors[@error]}" if !@error.nil?

    #print request
    puts "#{player.name}, please input a letter."
  end

  
  ###     Logic     ###

  def run
    dummie_players
    # set_players
    while !@players.one? { |player| player.activ }
      play_round
      @round_over = false
    end
    
    @players.each do |player|
      puts "***   #{player.name} is a WINNER!!!   ***" if player.activ 
    end 
  end

  def play_round
    while !valid_word?

      @players.each do |player|
        if !@round_over
          @current_player = player if player.activ
          take_turn(@current_player)
        end
      end
    end

    @current_player.score += 1
    @current_player.activ = false if @current_player.score == 2
    @fragment = ''
    clear_terminal
    display_stats
    puts "#{@current_player.name} you created a valid word, and EARNED a letter."
    puts ''
  end

  # gets a string from the player until a valid play is made; then updates the fragment and checks against the dictionary.
  def take_turn(player)
    clear_terminal
    display_stats
    display_message(player)

    # get a letter
    letter = gets.chomp.downcase
    
    # # and adds letter to fragmen if true else repet a round for same player
    if valid_play?(letter)
      @fragment += letter
    else
      take_turn(@current_player) 
    end
    
    # reduce dictionarys size
    @round_over = true if valid_word?
  end


  # checks that string is a letter of the alphabet and that there are words we can spell after adding it to the fragment. 
  def valid_play?(string)
    alphabet = ('a'..'z').to_a

    #chek if it is a single letter
    if string.length != 1
      @error = 'legth'
      return false
    end

    #check if it is a letter
    if !alphabet.include?(string)
      @error = 'not letter'
      return false
    end

    #check there is a word in dictionary that maches the fragment after adding letter to it
    if !in_dictionary?(string)
      @error = 'invalid word'
      return false
    end

    @error = nil
    true
  end


  # check if string exists in dictionary
  def in_dictionary?(string)
    @dictionary.keys.any? do |k|
      k[0..@fragment.length] == @fragment + string
    end
  end

  # check if the word is valid / complete
  def valid_word?
    @dictionary.keys.any? { |k| @fragment == k }
  end

  # create smaler dectionary which reflect fragment
  def trim_dictionary
    temp_dict = {}

    @dictionary.each_key do |k|
      temp_dict[k] = true if k[0...@fragment.length] == @fragment
    end

    @dictionary = temp_dict
  end
  
  def to_letter(num)
    'GHOST'[0...num]
  end

  def clear_terminal
    system 'clear'
  end

end