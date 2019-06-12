class Player

  attr_reader :name
  attr_accessor :score
  def initialize(name)
    @name = name
    @score = 4
    @playing = true
  end

  def guess

  end

  def alert_invalid_guess

  end

end