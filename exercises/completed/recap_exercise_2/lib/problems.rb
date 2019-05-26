# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  num_1, num_2 = num_2, num_1 if num_1 > num_2
  (num_2..num_1*num_2).each { |num| return num if num % num_1 == 0 && num % num_2 == 0 }
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bi_hash = Hash.new(0)

  (0...str.length-1).each do |i|
    bi = str[i..i+1]
    bi_hash[bi] += 1
  end
  
  sorted = bi_hash.sort_by { |k,v| v }

  sorted.last[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
      hash = {}
      self.each { |k,v| hash[v] = k }
      hash
    end

end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
      count = 0

      (0...self.length).each do |first|
        (first+1...self.length).each do |second|
          count += 1 if self[first] + self[second] == num
        end
      end

      count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
      sorted = false
      prc ||= Proc.new { |a, b| a <=> b } #self[idx] <=> self[idx + 1]

      while sorted == false
        sorted = true
        
        (0...self.length-1).each do |i|

          spaceship = prc.call(self[i], self[i + 1])
          if spaceship > 0
            sorted = false
            self[i], self[i + 1] = self[i + 1], self[i]
          end

        end
      end

      self
    end
end

p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort