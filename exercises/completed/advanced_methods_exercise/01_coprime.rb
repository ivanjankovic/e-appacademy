# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
  min_num = [num_1, num_2].min
  max_num = [num_1, num_2].max
  min_num_factors = num_factors(min_num)
  min_num_factors.each {|fac| return false if max_num % fac == 0}
  return true
end

def num_factors(num)
  (2..num).select { |i| num % i == 0 }
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
