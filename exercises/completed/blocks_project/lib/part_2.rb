
# all_words_capitalized?
def all_words_capitalized?(words_arr)
  words_arr.all? do |word|
    word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
  end
end

# no_valid_url?
def no_valid_url?(urls_arr)
  ends = ['.com', '.net', '.io', '.org']
  urls_arr.none? do |url|
    end_with?(ends, url)
  end
end

def end_with?(ends, url)
  dot_idx = - url.reverse.index('.') - 1
  url_end = url[dot_idx..-1]
  ends.any? { |e| e == url_end }
end

# any_passing_students?
def any_passing_students?(stud_arr)
  stud_arr.any? do |stud|
    grades = stud[:grades]
    grades.sum / grades.length >= 75
  end
end

