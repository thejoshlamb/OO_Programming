class Plateau
	attr_accessor :width, :length

	def initialize(width,length)
		@width = width
		@length = length
	end
end

class Rover 
	attr_accessor :x_position, :y_position, :facing

	def initialize(input)
		@x_position = input.split(" ")[0]
		@y_position = input.split(" ")[1]
		@facing = input.split(" ")[2]
	end

	def instructions(instructions_string)
		instructions_array = instructions_string.split("")
	end
end

plateau1 = Plateau.new(5,5)
rover1 = Rover.new("1 2 N")
rover1.instructions("LMLMLMLMM")

#tests
puts plateau1.width
puts plateau1.length

puts rover1.x_position
puts rover1.y_position
puts rover1.facing