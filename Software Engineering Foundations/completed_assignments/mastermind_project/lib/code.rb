class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    arr = length.times.map { POSSIBLE_PEGS.keys.sample }
    Code.new(arr)
  end
  
  def self.from_string(pegs_str)
    Code.new(pegs_str.split(''))
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise 'no valid pegs'
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end
  
  def num_exact_matches(instance)
    count = 0
    
    instance.pegs.each_with_index do |peg, idx|
      count += 1 if instance[idx] == self[idx]
    end

    count
  end

  def num_near_matches(instance)
    count = 0
    instance.pegs.each { |peg| count += 1 if @pegs.include?(peg) }

    count - self.num_exact_matches(instance)
  end

  def ==(instance)
    # instance.pegs.length == self.num_exact_matches(instance)
    self.pegs == instance.pegs
  end
end
