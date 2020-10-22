require "franc"

RSpec.describe Franc do
  describe "#times" do
    it "returns a new object that compares to an object with the same value" do
      five = Franc.new(5)
      expect(five.times(2)).to be_equal Franc.new(10)
      expect(five.times(3)).to be_equal Franc.new(15)
    end
  end

  describe "#equals" do
    it "returns true when comparing 2 objects with the same value" do
      five = Franc.new(5)
      expect(five).to be_equal Franc.new(5)
    end

    it "returns false when comparing 2 objects with the different value" do
      five = Franc.new(5)
      expect(five).not_to be_equal Franc.new(6)
    end
  end
end
