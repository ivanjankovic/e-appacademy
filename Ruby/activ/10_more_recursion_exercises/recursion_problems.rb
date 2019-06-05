#Problem 1: 

def sum_recur(array)
  return 0 if array.empty?

  array.pop + sum_recur(array)
end

#test
# p sum_recur([1, 2, 3, 4, 5])


#Problem 2: 

def includes?(array, target)
  return false if array.empty?

  if array.pop == target
    return true
  else
    includes?(array, target)
  end
end

# test
# p includes?([1, 2, 3, 4, 5], 3)
# p includes?([1, 2], 3)
# p includes?([], 3)


# Problem 3: 

def num_occur(array, target)
  return 0 if array.empty?

  if array.pop == target
    return 1 + num_occur(array, target)
  else
    return num_occur(array, target)
  end
end

# test
# p num_occur([1, 2, 3, 4, 3, 5, 6, 3], 3)
# p num_occur([], 3)


# Problem 4: 

def add_to_twelve?(array)
  return false if array.length <= 1

  if array.shift + array.first == 12
    return true
  else
    add_to_twelve?(array)
  end
end

# test
# p add_to_twelve?([1, 2, 3, 9, 3, 5, 6, 3])
# p add_to_twelve?([9])
# p add_to_twelve?([])


# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(array)
  return true if array.length <= 1
  array.first > array[1] ? false : sorted?(array.drop(1))
end

# test
p sorted?([1, 2, 3, 4, 5])
p sorted?([1, 3, 3, 4, 2])
p sorted?([9])
p sorted?([])

# Problem 6: 

def reverse(string)
end
