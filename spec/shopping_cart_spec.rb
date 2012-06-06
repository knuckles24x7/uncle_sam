require "../uncle_sam"

describe ShoppingCart do
  before { 	@cart = ShoppingCart.new("cart1")
  			@item1 = ImportItem.new("imported perfume",27.99 , "cosmetics", 1)
  			@item2 = Item.new("perfume",18.99, "cosmetics",  1) 
  			@item3 = Item.new("pills", 9.75, "medical",  1) 
  			@item4 = ImportItem.new("imported chocolates", 11.25, "food", 1) 		 
  		}  		

  describe "when a cart is created" do
  	it "should have the session name of cart1" do
  		@cart.session = "cart1"
  	end

  	it "the number of items in the cart should be zero" do
  		@cart.count_of_items.should eq(0)
  	end
  end

  describe "when an imported item with a cost of 27.99 is added to an empty cart " do
  	before  {@cart.add_items(@item1)}

    it "there should be a count of one item in the cart" do
     	@cart.count_of_items.should eq(1)
    end

    it "the total tax of the cart should be 4.20" do
    	@cart.sales_tax.should eq(4.20)
    end

    it "the total cost of the cart should be 32.19" do
    	@cart.total.should eq(32.19)
    end
  end
end