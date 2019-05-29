def hipsterfy(word)
  vowels = 'aeiou'

  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      return word[0...i] + word[i+1..-1]
    end

    i -= 1
  end

  word
end

def vowel_counts(str)
  hash = Hash.new(0)
  vowels = 'aeiou'

  str.downcase.each_char do |char|
    if vowels.include?(char)
      hash[char] += 1
    end
  end

  hash
end

def caesar_cipher(message, num)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'

  message.each_char.with_index do |char, i|
    if alphabet.include?(char)
      a_idx = alphabet.index(char) + num
      message[i] =alphabet[a_idx % 26]
    end
  end
  
  message
end