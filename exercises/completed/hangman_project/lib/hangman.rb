class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index {|c, i| indices << i if char == c}
    indices
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char }
  end

  # PART 2

  def try_guess(char)
    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    else
      self.attempted_chars << char
      matches  = self.get_matching_indices(char)

      if matches.empty?
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, matches)
      end

      return true
    end

    
  end

  def ask_user_for_guess
    print 'Enter a char: '
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts 'Random word was: ' + @secret_word
      return true
    end

    false
  end

end
