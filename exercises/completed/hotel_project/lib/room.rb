class Room
  def initialize(num)
    @capacity = num
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    return true if self.occupants.length == self.capacity
    false
  end

  def available_space
    self.capacity - self.occupants.length
  end

  def add_occupant(name)
    return false if self.full?
    self.occupants << name
    true
  end
end
