
class Trip
	def initialize(stops)
		@stops = stops.split("")
		@trip_origin = stops[0]
	end

	def trip_length
		@stops[1..-1].each {|node| puts node}
	end
end

class Route < Trip
	attr_accessor :origin, :destination, :length

	def initialize(origin,destination,length)
		@origin = origin
		@destination = destination
		@length = length
	end
end

class Node < Route
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end


A = Node.new("A")
B = Node.new("B")
C = Node.new("C")
D = Node.new("D")
E = Node.new("E")

AB = Route.new(A,B,5)
BC = Route.new(B,C,4)
CD = Route.new(C,D,8)
DC = Route.new(D,C,8)
DE = Route.new(D,E,6)
AD = Route.new(A,D,5)
CE = Route.new(C,E,2)
EB = Route.new(E,B,3)
AE = Route.new(A,E,7)

#tests
puts "tests:"
puts C.name
puts AB.origin
puts AB.destination.name
puts AB.length
puts "---------"

puts "Trip?"
trip = gets.chomp
trip1 = Trip.new(trip)
trip1.trip_length




# Output


