# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum * 1.0 / self.length
  end

  def median
    return nil if self.empty?

    len = self.length
    sorted = self.sort
    if len % 2 == 1
      sorted[len/2]
    else
      (sorted[len/2 - 1] + sorted[len/2]) / 2.0
    end
  end

  def counts
    hash = Hash.new(0)

    self.each { |ele| hash[ele] += 1 }
    hash
  end

  def my_count(value)
    self.counts[value]
  end

  def my_index(value)
    return nil if self.include?(value) == false
    
    self.each_with_index { |el, i| return i if el == value }
  end

  def my_uniq
    self.counts.keys
  end

  def my_transpose
    dim = self.length
    tran = Array.new(dim) {Array.new(dim)}

    self.each_with_index do |row, i|
      row.each_with_index { |el, j| tran[j][i] = el }
    end
    
    tran
  end

end

p ["a", "b", "a", "a", "b"].my_uniq
