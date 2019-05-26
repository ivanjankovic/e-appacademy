
# select_even_nums
def select_even_nums(nums_arr)
  return nums_arr.select(&:even?)
end

# reject_puppies
def reject_puppies(dogs_arr)
  dogs_arr.reject {|dog| dog['age'] <= 2 }
end

# rcount_positive_subarrays
def count_positive_subarrays(arr_2d)
  arr_2d.count {|arr| arr.sum > 0 }
end

# aba_translate
def aba_translate(word)
  vowels = 'aeiou'
  w_arr = word.split('')

  w_arr.map! do |char|
    if vowels.include?(char)
      char + 'b' + char
    else
      char
    end
  end

  w_arr.join
end

# aba_array
def aba_array(word_arr)
  word_arr.map { |word| aba_translate(word) }
end