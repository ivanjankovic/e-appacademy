
# https://stackoverflow.com/questions/25168662/how-to-read-lines-from-file-into-array

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map { |word| word.chomp }
  end

  def adjacent_words(word)
    len_dictionary = dictionary.select { |dw| dw.length == word.length }
    adjacent_d = []
    
    idx = 0
    while idx < word.length
      len_dictionary.each do |lword|
        # p lword
        adjacent_d << lword if remove(lword, idx) == remove(word, idx)
      end

      idx += 1
    end
    adjacent_d
  end

  # removel letter from the word
  def remove(word, idx)
    word[0...idx] + word[idx+1..-1]
  end

end

wc = WordChainer.new('dictionary.txt')