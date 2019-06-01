require 'colorize'

class Tile

  attr_reader :value

  def initialize(value, from_file)
    @value = value
    @from_file = from_file
  end

  def to_s
    if @from_file
      self.value.to_s.light_cyan
    else
      self.value.to_s
    end
  end

end