# take list of inputs
# parse into examinable list
# calculate basic tax and apply
# calculate import tax and apply
# calculate total tax
# return list of items with tax

class Reciept

	def initialize(list)
		@list = list.split(" ")
	end

end

input1 = Reciept.new("1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85")
puts Reciept.list

