# My Each
# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerable's each method.

class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end 
end

# My Select
# Now extend the Array class to include my_select that takes a block and returns a new ? array containing only elements that satisfy the block. Use your my_each method!

class Array
  def my_select(&prc)
    selected = []

    self.my_each do |ele|
      selected << ele if prc.call(ele)
    end

    selected
  end
end

# My Reject
# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

class Array
  def my_reject(&prc)
    rest = []

    self.each do |ele|
      rest << ele unless prc.call(ele)
    end

    rest
  end
end

# My Any
# Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.

class Array
  def my_any?(&prc)
    self.each do |ele|
        return true if prc.call(ele)
    end

    false
  end

  def my_all?(&prc)
    self.each do |ele|
        return false if prc.call(ele) == false
    end

    true
  end
end

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

class Array
  def my_flatten
    flattend = []

    self.my_each do |ele|
      if ele.is_a?(Array)
        flattend.concat(ele.my_flatten)
      else
        flattend << ele
      end
    end

    flattend
  end
end

# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any ?argument is less than self, nil is returned for that location.

class Array
  #my solution

  def my_zip(*args)
    ziped = []
    arr = [self].concat(args)

    (0...self.length).each do |i|
      ele = []
      (0..args.length).each do |j|
        ele << arr[j][i]
      end
      ziped << ele
    end

    ziped
  end

  # def my_zip(*arrays)
  #   zipped = []

  #   self.length.times do |i|
  #     subzip = [self[i]]

  #     arrays.my_each do |array|
  #       subzip << array[i]
  #     end

  #     zipped << subzip
  #   end

  #   zipped
  # end
end

# My Rotate
# Write a method my_rotate that returns self rotated. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.

class Array
  # my solution
  def my_rotate(num=1)
    num.abs.times do
      if num > 0
        first_ele = self.shift
        self.push(first_ele)
      else
        last_ele = self.pop
        self.unshift(last_ele)
      end
    end
    
    self
  end

  # solution
  def my_rotate(positions = 1)
    split_idx = positions % self.length

    self.drop(split_idx) + self.take(split_idx)
  end
end

# test

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



# My Join
# my_join returns a single string containing all the elements of the array, separated by the given string separator. If no separator is given, an empty string is used.

class Array
  def my_join(separator='')
    joined = ''

    (0...self.length).each do |i|
      joined += self[i]
      joined += separator unless i == self.length - 1
    end

    joined
  end
end

# test

# p a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"



# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.

class Array
  def my_reverse
    reversed = []

    self.my_each { |ele| reversed.unshift(ele) }

    reversed
  end
end

# test

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]
