require 'money'
require 'bank'

RSpec.describe 'Multi-Currency integration' do
  describe '#times' do
    it 'returns a new object that compares to an object with the same value' do
      five = Money.dollar(5)
      expect(five.times(2)).to be_equal Money.dollar(10)
      expect(five.times(3)).to be_equal Money.dollar(15)
    end

    it 'returns a new object that compares to an object with the same value' do
      five = Money.franc(5)
      expect(five.times(2)).to be_equal Money.franc(10)
      expect(five.times(3)).to be_equal Money.franc(15)
    end
  end

  describe '#equals' do
    it 'returns false when comparing 2 objects with the same value from different currencies' do
      expect(Money.dollar(5)).not_to be_equal Money.franc(5)
    end

    it 'returns true when comparing 2 objects with the same value' do
      five = Money.dollar(5)
      expect(five).to be_equal Money.dollar(5)
    end

    it 'returns false when comparing 2 objects with the different value' do
      five = Money.dollar(5)
      expect(five).not_to be_equal Money.dollar(6)
    end

    it 'returns true when comparing 2 objects with the same value' do
      five = Money.franc(5)
      expect(five).to be_equal Money.franc(5)
    end

    it 'returns false when comparing 2 objects with the different value' do
      five = Money.franc(5)
      expect(five).not_to be_equal Money.franc(6)
    end
  end

  describe '#currency' do
    it 'returns the correct currency' do
      expect(Money.dollar(1).currency).to eq 'USD'
      expect(Money.franc(1).currency).to eq 'CHF'
    end
  end

  describe '#plus' do
    it 'returns the correct result for the addition' do
      sum = Money.dollar(5).plus(Money.dollar(5))
      bank = Bank.new
      reduced = bank.reduce(sum, 'USD')
      expect(Money.dollar(10)).to be_equal reduced
    end
  end
end
