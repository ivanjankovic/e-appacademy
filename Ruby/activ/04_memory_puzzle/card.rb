
class Card

  attr_reader :value
  attr_accessor :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    self.face_up = true
  end

  def hide1
    face_up = false
  end
  def hide2
    self.face_up = false
  end
  def hide3
    @face_up = false
  end

  def ==(other)
    self.value == other.value
  end

  def to_s
    if face_up
      value 
    else
      ' '
    end
  end

end