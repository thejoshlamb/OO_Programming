#everyone is a person
class Person
	
	attr_accessor :name

	def greeting
		puts "Hi, my name is #{@name}."
	end

end

#class for students, who get stuff
class Student < Person

	def learn
		puts "I get it!"
	end

end

#class for instructors, who love objects
class Instructor < Person

	def teach
		puts "Everything in Ruby is an object."
	end

end

#Instantiate new instructor Chris
Chris = Instructor.new
Chris.name = "Chris"
Chris.greeting

#Instantiate new student Cristina
Cristina = Student.new
Cristina.name = "Cristina"
Cristina.greeting

#teaching and learning
Chris.teach
Cristina.learn

#calling learn to the Instructor class doesn't work, as the Instructor class does not have or inherit this method.
#Chris.learn