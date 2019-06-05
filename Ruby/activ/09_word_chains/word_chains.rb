
# https://stackoverflow.com/questions/25168662/how-to-read-lines-from-file-into-array

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name)
  end

  def adjacent_words(word)
    same_len_words = dictionary.map { |dw| word.length == dw.length }
    
    p  same_len_words.length

    # dictionary.each do |d_word|
    #   if word.chars.one? { |char| d_word.chars.include?(char)}
    # end
  end

end