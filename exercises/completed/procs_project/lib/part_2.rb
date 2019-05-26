# reverser
def reverser(str, &prc)
  prc.call(str.reverse)
end

# word_changer
def word_changer(sentence, &prc)
  words = sentence.split
  cahnged_w = words.map {|word| prc.call(word)}
  cahnged_w.join(' ')
end

# greater_proc_value
def greater_proc_value(num, prc1, prc2)
  res_1 = prc1.call(num)
  res_2 = prc2.call(num)
  if  res_1 > res_2
    return res_1
  else
    return res_2
  end
end

# and_selector
def and_selector(arr, prc1, prc2)
  p arr.select { |el| prc1.call(el) && prc2.call(el)}
end

# alternating_mapper
def alternating_mapper(arr, prc1, prc2)
  arr.map.with_index do |el, i|
    if i.even?
      prc1.call(el)
    else
      prc2.call(el)
    end
  end

end
