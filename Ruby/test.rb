def power_of_two_2?(n)

  i = n
  while i > 2
    if i % 2 == 0
      i = i / 2
    else
      return false
    end

  end

  return true
end
def power_of_two_1?(num)
  power = 1

  while power < num
    power *= 2
  end

  num == power
end



