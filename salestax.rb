# take list of inputs
# parse into examinable list
# calculate basic tax and apply
# calculate import tax and apply
# calculate total tax
# return list of items with tax

# 1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85

#defining tax exempt keywords
$tax_exempt_keywords = ["book","chocolate","pills"]

class Item
		attr_accessor :quantity
		attr_accessor :description
		attr_accessor :price
		attr_accessor :basic_tax
		attr_accessor :import_tax

		def initialize(quantity, description, price)
			@quantity = quantity
			@description = description
			@price = price
			@basic_tax = 0.0
			@import_tax = 0.0
		end

		def tax_exempt?
			$tax_exempt_keywords.each do |keyword|
				return true if @description.include?(keyword)
			end
			return false
		end

		def imported?
			return false unless @description.include?("imported")
		end

		def calculate_basic_tax
			@basic_tax = @price * 0.1 unless tax_exempt?
		end

		def calculate_import_tax
			@import_tax = @price * 0.05 if imported?
		end

		def display
			print "#{@quantity} "
			print "#{@description}: "
			print "$#{@price} "
			print "Sales Taxes: $#{@basic_tax+@import_tax} " unless (@basic_tax+@import_tax == 0)
		end
end

item1 = Item.new(1,"book",12.49)
item2 = Item.new(1,"music CD",10.00)
item3 = Item.new(1,"chocolate bar",12.49)
Reciept1 = [item1, item2, item3]

item1.calculate_basic_tax
item1.calculate_import_tax
item1.display






