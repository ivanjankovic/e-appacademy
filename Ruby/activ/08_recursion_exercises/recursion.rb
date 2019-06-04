# Learning Goals

# Know how to reason about recursive programs
# Be able to write a base case for a recursive method
# Be able to write the inductive step for a recursive method
# Be able to explain the benefits of writing a method recursively vs. iteratively
# Be able to trace a recursive method and figure out how many recursive steps it will take
# Know how to write recursive sorting and searching algorithms

# Warmup

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(start, ending)
  return [] if start >= ending

  return [start] + range(start + 1, ending)
end

# test
# p range(1, 5)

# Write both a recursive and iterative version of sum of an array.

def recursive_sum(n)
  return n if n == 0

  return n + recursive_sum(n - 1)
end

def iterative_sum(n)
  count = 0
  (1..n).each { |i| count += i }
  return count
end

# test
# p recursive_sum(5)
# p iterative_sum(5)



###   Excercise 1 - Exponentiation   ###

# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

def exp(b, n)
  return b if n == 0 || n == 1
  
  return b * exp(b, n - 1)
end

# test
# p exp(2, 3)


def exp(b, n)
  return b if n == 0 || n == 1
  
  if n.even?
    return exp(b, n / 2) ** 2
  else
    return b * exp(b, n - 1)
  end
end

# test
# p exp(2, 3)


###   Excercise 2 - Deep dup array  ###

def deep_dup(arr)
  copy = []

  arr.each do |ele|
    if !ele.kind_of?(Array)
      copy << ele
    else
      copy << deep_dup(ele)
    end
  end

  return copy
end

# test
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# robot_parts_copy = deep_dup(robot_parts)
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] 

###   Excercise 3 - Fibonacci   ###

def fib_recur(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return fib_recur(n - 1) + fib_recur(n - 2)
  end
end

# test
# p fib_rec(3), fib_rec(4), fib_rec(5), fib_rec(6), fib_rec(7)

def fib_itera(n)
  a, b = 0, 1
  
  if n == 0
    return 0
  elsif n == 1
    return 1
  end
  i = 1
  while i < n
    result = a + b
    a = b
    b = result
    i += 1 
  end

  result
end

# test
# p fib_itera(3), fib_itera(4), fib_itera(5), fib_itera(6), fib_itera(7)


###   Excercise 4 - Binary Search   ###

def bsearch(array, target)
  return nil if array.length == 1 && target != array[0]
  idx = array.length / 2
  mid_ele = array[idx]

  if target == mid_ele
    return idx
  elsif target < mid_ele
    return bsearch(array[0...idx], target)
  else
    if bsearch(array[idx+1..-1], target).nil?
      return nil
    else
      return idx + 1 + bsearch(array[idx+1..-1], target)
    end
  end
end

# test

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

###   Excercise 5 - Merge Sort   ###

###   Excercise 6 - Array Subsets   ###

###   Excercise 7 - Permutations   ###

###   Excercise 8 - Make Change   ###
