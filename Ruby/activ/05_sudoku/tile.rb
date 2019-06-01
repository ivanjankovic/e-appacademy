require 'colorize'

class Tile

  attr_reader :start_value, :user_value

  def initialize(value=nil)
    @start_value = value
  end

  def assign_value(value)
    @user_value = value if @user_value.nil?
  end

  def to_s
    if !self.start_value.nil?
      self.start_value.to_s.light_black
    elsif !self.user_value.nil?
      self.user_value
    else
      ''
    end
  end

end