class Person
	
	attr_accessor :name

	def greeting
		puts "Hi, my name is #{@name}"
	end

end

class Student < Person

	def learn
		puts "I get it!"
	end

end

class Instructor < Person

	def teach
		puts "Everything in Ruby is an object."
	end

end

Josh = Student.new
Josh.name = "Josh"
Josh.greeting
Josh.learn