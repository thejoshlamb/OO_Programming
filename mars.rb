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
		@x_position = input.split(" ")[0].to_i
		@y_position = input.split(" ")[1].to_i
		@facing = input.split(" ")[2]
	end

	def instructions(instructions_string)
		instructions_array = instructions_string.split("")
		instructions_array.each do |command|
			case command
			when "L"
				turn_left
			when "R"
				turn_right
			when "M"
				move_forward
			end
		end
	end
		

	def turn_right
		case @facing
		when "N"
			@facing = "W"
		when "E"
			@facing = "N"
		when "S"
			@facing = "E"
		when "W"
			@facing = "S"
		end
	end

	def turn_left
		case @facing
		when "N"
			@facing = "E"
		when "E"
			@facing = "S"
		when "S"
			@facing = "W"
		when "W"
			@facing = "N"
		end
	end

	def move_forward
		case @facing
		when "N"
			@y_position += 1
		when "E"
			@x_position += 1
		when "S"
			@y_position -= 1
		when "W"
			@y_position -= 1
		end
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