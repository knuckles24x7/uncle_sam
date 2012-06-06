require "../uncle_sam"

describe Item do
  before { @item = Item.new("PartA", 10.50, "xxx",  1) }

  subject { @item } 
    it { should respond_to(:name) }
    it { should respond_to(:cost) }
    it { should respond_to(:category) }
    it { should respond_to(:qty) }


    describe "when cost is 10.50 and item category is not exempt" do
      it "tax should be 1.05" do
        @item.calculate_sales_tax.should eq(1.05) 
      end
    end

    describe "when cost is 10.50 and item category is exempt" do
      it "tax should be 0" do
        @item.category = "food"
        @item.calculate_sales_tax.should eq(0) 
      end
    end

    describe "when cost is 10.50 and item category is not exempt" do
      it "when the qty is one total cost should be 11.55" do
        @item.category = "xxx"
        @item.qty = 1
        @item.total_cost.should eq(11.55) 
      end

      it "when the qty is ten total cost should be 111.50" do
        @item.category = "xxx"
        @item.qty = 10
        @item.total_cost.should eq(115.50) 
      end
    end

    describe "when cost is 10.50 and item category is exempt" do
      it "when the qty is one total cost should be 10.50" do
        @item.category = "food"
        @item.qty = 1
        @item.total_cost.should eq(10.50) 
      end

      it "when the qty is ten total cost should be 105" do
        @item.category = "food"
        @item.qty = 10
        @item.total_cost.should eq(105) 
      end
    end
end

describe ImportItem do
  before { @item = ImportItem.new("Some Item", 11.25, "not exempt",  1) }

  subject { @item } 
    it { should respond_to(:name) }
    it { should respond_to(:cost) }
    it { should respond_to(:category) }
    it { should respond_to(:qty) }


    describe "when cost is 11.25 and item category is not exempt" do
      it "tax should be 1.05" do
        @item.calculate_sales_tax.should eq(1.75) 
      end
    end

    describe "when cost is 11.25 and item category is exempt" do
      it "tax should be .60" do
        @item.category = "food"
        @item.calculate_sales_tax.should eq(0.60) 
      end
    end

    describe "when cost is 11.25 and item category is not exempt" do
      it "when the qty is one total cost should be 13.00" do
        @item.category = "xxx"
        @item.qty = 1
        @item.total_cost.should eq(13.00) 
      end

      it "when the qty is ten total cost should be 129.40" do
        @item.category = "xxx"
        @item.qty = 10
        @item.total_cost.should eq(129.40) 
      end
    end

    describe "when cost is 11.25 and item category is exempt" do
      it "when the qty is one total cost should be 11.85" do
        @item.category = "food"
        @item.qty = 1
        @item.total_cost.should eq(11.85) 
      end

      it "when the qty is ten total cost should be 118.15" do
        @item.category = "food"
        @item.qty = 10
        @item.total_cost.should eq(118.15) 
      end
    end
end