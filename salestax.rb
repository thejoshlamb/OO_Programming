#defining tax exempt keywords before we begin
$tax_exempt_keywords = ["book","chocolate","pill","kitten"]

#The reciept class contains the totals for the bill
class Reciept
	def initialize(basket)
		@basket = basket
		@@total_tax = 0.0
		@@total_price = 0.0
	end

	# calculates taxes for all items, as well as the total for the reciept
	def calculate_totals
		@basket.each do |item|
			item.calculate_tax
			@@total_price += item.price
			@@total_price += item.tax
		end
	end

	#prints the whole reciept. note that '%.2f' is used to ensure two decimal places are always returned
	def print_reciept
		@basket.each { |item| item.display }
		puts "Sales Tax: $#{('%.2f' % @@total_tax)}" unless @@total_tax == 0.0
		puts "Total: $#{'%.2f' % @@total_price}"
	end
end

# The item class is used for each individual item
class Item < Reciept
		attr_accessor :quantity, :description ,:price, :tax
		#attr_accessor :unitprice

		def initialize(quantity, description, price)
			@quantity = quantity
			@description = description
			#@unitprice = price
			@price = price * quantity * 100
			@tax = 0.0
		end

		def basic_tax_rate
			0.10
		end

		def import_tax_rate
			0.05
		end

		#checks to see if the item is exempt for basic tax by iterating through known tax-exempt keywords
		def tax_exempt?
			$tax_exempt_keywords.each do |keyword|
				return true if @description.include?(keyword)
			end
			return false
		end

		#checks to see if the item is imported by looking for the word "imported"
		def imported?
			return false unless @description.include?("import")
			return true
		end

		#calculates applicable taxes for the item
		def calculate_tax
			basic_tax = 0.0
			import_tax = 0.0
			basic_tax = @price * basic_tax_rate unless tax_exempt?
			import_tax = @price * import_tax_rate if imported?
			#basic_tax = (basic_tax*20).ceil/20
			#import_tax = (import_tax*20).ceil/20
			@tax = basic_tax + import_tax
			@@total_tax += @tax
		end

		def display
			puts "#{@quantity} #{{description}}"
			print "#{@quantity} "
			print "#{@description}: "
			print "$#{'%.2f' % (@price+@tax)} "
			puts
		end
end

item1 = Item.new(1,"book",12.49)
item2 = Item.new(1,"music CD",14.99)
item3 = Item.new(1,"chocolate bar",0.85)
item4 = Item.new(1,"imported box of chocolates",10.00)
item5 = Item.new(1,"imported bottle of perfume",47.50)
item6 = Item.new(1,"imported bottle of perfume", 27.99)
item7 = Item.new(1,"bottle of perfume",18.99)
item8 = Item.new(1,"packet of headache pills",9.75)
item9 = Item.new(1,"box of imported chocolates",11.25)

Reciept1 = Reciept.new([item1,item2,item3])
Reciept1.calculate_totals
Reciept1.print_reciept

Reciept2 = Reciept.new([item4,item5])
Reciept2.calculate_totals
Reciept2.print_reciept

Reciept3 = Reciept.new([item6,item7,item8, item9])
Reciept3.calculate_totals
Reciept3.print_reciept







