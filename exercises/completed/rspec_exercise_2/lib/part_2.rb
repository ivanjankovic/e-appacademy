def palindrome?(str)
  
  i = 0
  while i <= str.length/2
    if str[i] != str[-1 - i]
      return false
    end

    i += 1
  end

  true
end


def substrings(str)
  str_arr = []
  
  j = 0
  while j < str.length
    i = j
    while i < str.length
      str_arr << str[j..i]
      i += 1
    end

    j += 1
  end

  str_arr
end


def palindrome_substrings(str)
  substrings(str).select { |s_str| palindrome?(s_str) && s_str.length > 1 }
end