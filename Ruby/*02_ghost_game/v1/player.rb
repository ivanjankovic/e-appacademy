class Player

  attr_reader :name, :score, :activ
  attr_writer :score, :activ

  def initialize(name)
    @name = name
    @score = 0
    @activ = true
  end

  def guess
    
  end

  def alert_invalid_guess

  end
end