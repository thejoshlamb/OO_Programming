module Utils
	def self.round(number)
		return number if number % 5 == 0
		number + 5 - (number % 5)
	end

	def self.formatted(number)
		return '%.2f' % (number / 100)
	end
end

class Receipt	
	@@tax_exempt_keywords = ["book","chocolate","pill","kitten"]
	attr_accessor :basket
	
	def initialize(basket)
		@basket = basket
	end

	def basic_tax_rate
		0.10
	end

	def import_tax_rate
		0.05
	end

	def total_tax
		totaltax = 0
		basket.each do |item|
			totaltax += item.tax
		end
		return Utils.formatted(totaltax)
	end

	def total
		tot = 0
		basket.each do |item|
			tot += item.total_price
		end
		return Utils.formatted(tot)
	end

	def print_receipt
		basket.each {|item| item.display }
		puts "Sales Tax: $#{total_tax}" unless total_tax == 0
		puts "Total: $#{total}"
	end

end

class Item < Receipt
	attr_accessor :quantity, :description, :price

	def initialize(quantity,description,price)
		@quantity = quantity
		@description = description
		@price = price * quantity * 100
		@tax = 0
	end

	def is_exempt?
		@@tax_exempt_keywords.each do |keyword|
				return true if @description.include?(keyword)
		end
		return false
	end

	def is_imported?
		return false unless @description.include?("import")
		return true
	end

	def tax_rate
		rate = 0
		rate = rate + basic_tax_rate unless is_exempt?
		rate = rate + import_tax_rate if is_imported?
		return rate
	end

	def tax
		Utils.round(@price * tax_rate)
	end

	def total_price
		price + tax
	end


	def display
		puts "#{quantity} #{description}: $#{Utils.formatted(total_price)}"
	end
end


#items
item1 = Item.new(1,"book",12.49)
item2 = Item.new(1,"music CD",14.99)
item3 = Item.new(1,"chocolate bar",0.85)
item4 = Item.new(1,"imported box of chocolates",10.00)
item5 = Item.new(1,"imported bottle of perfume",47.50)
item6 = Item.new(1,"imported bottle of perfume", 27.99)
item7 = Item.new(1,"bottle of perfume",18.99)
item8 = Item.new(1,"packet of headache pills",9.75)
item9 = Item.new(1,"box of imported chocolates",11.25)

#reciepts
Receipt1 = Receipt.new([item1,item2,item3])
Receipt1.print_receipt

puts "-------------------------------------"

Receipt2 = Receipt.new([item4,item5])
Receipt2.print_receipt

puts "-------------------------------------"

Receipt3 = Receipt.new([item6,item7,item8, item9])
Receipt3.print_receipt

puts "-------------------------------------"

#tests
puts item1.quantity
puts item1.description
puts item1.price
puts item1.tax_rate
puts item1.tax
puts item1.total_price

item1.display



