# puts "Welcome to the widget store!"
# puts "How many widgets would you like to order"
# quantity = gets.chomp.to_i

# if quantity < 50
#   price = 10
# elsif quantity > 50
#   price = 9
# else
#   price = 8
# end

# cost = quantity * price
# puts "The price for #{quantity} widgets is $#{cost}."


# benchmarker

# class SimpleBenchmarker
#   def run(description, &block)
#     start_time = Time.now
#     block.call 
#     end_time = Time.now
#     elapsed = end_time - start_time
#     puts "\n"
#     puts "#{description} results"
#     puts "Elapsed time: #{elapsed} seconds"
#   end
# end

# benchmarker = SimpleBenchmarker.new
# benchmarker.run "Sleep a random amount of time" do
#   5.times do 
#     print "."
#     sleep(rand(0.1..1.0))
#   end
# end

class MyArray
  attr_reader :array
  def initialize
    @array = []
  end

  def push(item)
    array.push(item)
  end

  def each(&block)
    i = 0
    while i < array.length
      block.call(array[i])
      i += 1
    end
    array
  end
end

my_array = MyArray.new
my_array.push(1)
my_array.push(2)
my_array.push(3)

p my_array.methods.sort
p Array.methods.sort