require 'colorize'

class Tile

  attr_accessor :value, :from_file

  def initialize(value, from_file)
    @value = value
    @from_file = from_file
  end

  def to_s
    if @from_file
      self.value.to_s.light_cyan
    elsif @value.nil? 
      '?'.light_black
    else
      self.value.to_s
    end
  end

end