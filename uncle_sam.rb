class Numeric
	def round_up_to_nickel
		(self * 20).ceil.to_f/20
	end
end

class Item
	attr_accessor :name, :cost, :category, :qty
	@@exempt = {books: true, food: true, medical: true}
	@@exempt.default = false

	def initialize(name, cost, category, qty)
		@name = name
		@cost = cost
		@category = category
		@qty = qty
	end

	def calculate_sales_tax
		if  @@exempt[@category.to_sym]
			tax = 0
		else
			tax = ((@cost * @qty) * 0.10).round_up_to_nickel
		end
		return tax
	end

	def sub_total
		@cost * @qty
	end

	def total_cost
		sub_total + calculate_sales_tax
	end
end

class ImportItem < Item 
	def calculate_sales_tax
		(super + ( sub_total * 0.05 )).round_up_to_nickel
	end

	def total_cost
		(sub_total + calculate_sales_tax)
	end
end

class ShoppingCart
	attr_accessor :session, :items, :sales_tax, :total

	 def initialize(session)
	 	@session_name = session
	 	@items = []
	 	@sales_tax = 0
	 	@total = 0
	 end

	def add_items(item)
		@items << item
		@sales_tax += item.calculate_sales_tax
		@total += item.total_cost
	end

	def count_of_items
		@items.count
	end

	def checkout
		puts "\n\n#{@session_name}"
		@items.each { |e| 
			puts "#{e.name}: #{"%.2f" % e.total_cost}"  
		}
		puts "Sales Tax: #{"%.2f" % @sales_tax}"
		puts "Total: #{"%.2f" % @total}"
	end
end

class Input
	attr_accessor :input, :item, :item_name, :item_cost, :item_qty, :category

	@@classifications = {
						 "book" 						=> "books", 
						 "music cd" 					=> "music",
						 "chocolate bar" 				=> "food",
						 "imported box of chocolates" 	=> "food",
						 "imported bottle of perfume" 	=> "cosmetics",
						 "bottle of perfume"			=> "cosmetics",
						 "packet of headache pills" 	=> "medical",
						 "box of imported chocolates" 	=> "food"
						}
	@@classifications.default = "uncategorized"						

	def initialize(input)
		parsed 			= input.scan(/(.*)\s(at)\s(.*)/)
		@item_name 		= parsed[0][0]
		@item_cost 		= (parsed[0][2]).to_f
		@item_qty 		= item_name.gsub(/\D/,"").strip.to_i
		classification	= item_name.gsub(/\d/,"").strip
		@category    	= @@classifications[classification.downcase]

		if @item_name =~/import/
			@item = ImportItem.new(item_name, item_cost, category, item_qty)
		else
			@item = Item.new(item_name, item_cost, category, item_qty)
		end
	end	
end
