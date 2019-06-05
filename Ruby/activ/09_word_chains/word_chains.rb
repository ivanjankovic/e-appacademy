
# https://stackoverflow.com/questions/25168662/how-to-read-lines-from-file-into-array

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name)
  end 
end