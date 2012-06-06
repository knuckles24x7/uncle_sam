require "../uncle_sam"
describe Input do
	describe "With the following input '1 imported bottle of perfume at 47.50'" do
  		before { @input =	Input.new("1 imported bottle of perfume at 47.50")}  

		it "an ImportItem should be created" do
			@input.item.class.should eq(ImportItem)
		end

		it "the parsed item description should be" do
			@input.item_name.should eq("1 imported bottle of perfume")
		end

		it "the parsed item quantity should be 1" do
			@input.item_qty.should eq(1)
		end

		it "the parsed item cost should be 47.50" do
			@input.item_cost.should eq(47.50)
		end

		it "the category should be cosmetics" do
			@input.category.should eq("cosmetics")
		end
	end

	describe "With the following input '9999999 widgets at 1.35'" do
  		before { @input =	Input.new("9999999 widgets at 1.35")}  

		it "an Item should be created" do
			@input.item.class.should eq(Item)
		end

		it "the parsed item description should be" do
			@input.item_name.should eq("9999999 widgets")
		end

		it "the parsed item quantity should be 1" do
			@input.item_qty.should eq(9999999)
		end

		it "the parsed item cost should be 47.50" do
			@input.item_cost.should eq(1.35)
		end

		it "the category should be cosmetics" do
			@input.category.should eq("uncategorized")
		end
	end
end