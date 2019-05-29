
def partition(arr, num)
  arr_1 = []
  arr_2 = []

  arr.each do |ele|
    if ele < num
      arr_1 << ele
    else
      arr_2 << ele
    end
  end

  [arr_1, arr_2]
end

def merge(hash_1, hash_2)
  new_hash = {}
  
  hash_1.each { |key, value| new_hash[key] = value }
  hash_2.each { |key, value| new_hash[key] = value }

  new_hash
end

def censor(sent, arr)
  words = sent.split
  words_arr = words.each do |word|
    
    if arr.include?(word.downcase)
      replace_vowel(word)
    end
  end
  words_arr.join(' ')
end

def replace_vowel(word)
  vowel = 'aeiou'

  word.each_char.with_index do |char, i|
    if vowel.include?(char.downcase)
      word[i] = '*'
    end
  end
end

def power_of_two?(num)
  power = 1

  while power < num
    power *= 2
  end

  num == power
end