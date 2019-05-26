require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = hash.transform_values { |capacity| Room.new(capacity) }
  end

  def name
    @name.split.map {|word| word.capitalize }.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.include?(room)
  end

  def check_in(person, room)
    # if self.room_exists?(room) == false
    #   puts 'sorry, room does not exist'
    # else
    #   if @rooms[room].add_occupant(person)
    #     puts 'check in successful' 
    #   else
    #     puts 'sorry, room is full'
    #   end
    # end

    if self.room_exists?(room)
      if @rooms[room].add_occupant(person)
        puts 'check in successful' 
      else
        puts 'sorry, room is full'
      end
      
    else
      puts 'sorry, room does not exist'
    end
  
  end

  def has_vacancy?
    @rooms.each { |name, inst| return true if !inst.full? }
    false
  end

  def list_rooms
    @rooms.each do |name, insta|
      puts "#{name}: #{insta.available_space}"
    end
  end
end
