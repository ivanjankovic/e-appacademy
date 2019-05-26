# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

# largest_prime_factor
def largest_prime_factor(num)
  divisor = 1

  (2..num).each do |i|
    if num % i == 0 && is_prime?(i)
      divisor = i
    end
  end

  divisor
end

def is_prime?(num)
  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end

  return true
end

# unique_chars?
def unique_chars?(string)
  hash = Hash.new(0)

  string.each_char do |char|
    hash[char] += 1
  end

  hash.length == string.length
end

# dupe_indices
def dupe_indices(arr)
  hash = Hash.new { |h,k| h[k] = [] }

  arr.each_with_index do |ele, idx|
    hash[ele] << idx
  end

  hash.select { |key, val| val.length > 1}
end

# ana_array
def ana_array(arr_1, arr_2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  arr_1.each { |ele| hash_1[ele] += 1}
  arr_2.each { |ele| hash_2[ele] += 1}
  hash_1 == hash_2
end