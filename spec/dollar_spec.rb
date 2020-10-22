require "dollar"

RSpec.describe Dollar do
  describe "#times" do
    it "returns a new object and preserves the original amount" do
      five = Dollar.new(5)
      product = five.times(2)
      expect(product.amount).to eq 10
      product = five.times(3)
      expect(product.amount).to eq 15
    end
  end

  describe "#equals" do
    it "returns true when comparing 2 objects with the same value" do
      five = Dollar.new(5)
      expect(five.equals(Dollar.new(5))).to eq true
    end

    it "returns false when comparing 2 objects with the different value" do
      five = Dollar.new(5)
      expect(five.equals(Dollar.new(6))).to eq false
    end
  end
end
