def average(num_1, num_2)
  (num_1 + num_2)/2.0
end

def average_array(nums)
  nums.sum / (nums.length * 1.0)
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(string)
  words = string.split
  words.map!.with_index do |ele, i|
    if i.even?
      ele.upcase
    else
      ele.downcase
    end
  end

  words.join(' ')
end
