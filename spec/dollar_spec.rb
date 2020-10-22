require "dollar"

RSpec.describe Dollar do
  describe "#times" do
    it "returns a new object that compares to an object with the same value" do
      five = Dollar.new(5)
      expect(five.times(2)).to be_equal Dollar.new(10)
      expect(five.times(3)).to be_equal Dollar.new(15)
    end
  end

  describe "#equals" do
    it "returns true when comparing 2 objects with the same value" do
      five = Dollar.new(5)
      expect(five).to be_equal Dollar.new(5)
    end

    it "returns false when comparing 2 objects with the different value" do
      five = Dollar.new(5)
      expect(five).not_to be_equal Dollar.new(6)
    end
  end
end
