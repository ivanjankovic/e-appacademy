def array(words)
  new_array = []
  i = 0
  while i < words.length
    if (words[i].length < 6 || words[0] == 'e') && !(words[i].length < 6 && words[0] == 'e')
      then new_array << words[i]
    end
    i += 1
  end
  return new_array
end

print array(['eggs', 'exponential', 'cat', 'ether'])