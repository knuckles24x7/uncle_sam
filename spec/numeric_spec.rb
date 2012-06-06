require "../uncle_sam"

describe Numeric do
  describe "when 10.12 is rounded up to the nearest nickel" do
    it "value should be 10.15" do
      10.12.round_up_to_nickel.should eq(10.15)
    end
  end
end