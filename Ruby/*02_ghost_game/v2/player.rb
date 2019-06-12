class Player

  attr_reader :name
  attr_accessor :score, :activ
  def initialize(name)
    @name = name
    @score = 4
    @activ = true
  end

  def guess

  end

  def alert_invalid_guess

  end

end