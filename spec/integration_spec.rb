require 'money'
require 'bank'

RSpec.describe 'Multi-Currency integration' do
  describe 'multiplication' do
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

  describe 'checking equality' do
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

  describe 'checking currency' do
    it 'returns the correct currency' do
      expect(Money.dollar(1).currency).to eq 'USD'
      expect(Money.franc(1).currency).to eq 'CHF'
    end
  end

  describe 'addition' do
    let(:five) { Money.dollar(5) }
    let(:bank) { Bank.new }

    it 'the sum of two money objects returns a sum object' do
      sum = five.plus(five)
      expect(sum.augend).to be_equal five
      expect(sum.addend).to be_equal five
    end

    it 'returns the correct result for the addition' do
      sum = five.plus(Money.dollar(3))
      reduced = bank.reduce(sum, 'USD')
      expect(Money.dollar(8)).to be_equal reduced
    end

    context 'when bank receives money instead of an expression' do
      it 'returns money' do
        result = bank.reduce(Money.dollar(1), 'USD')
        expect(Money.dollar(1)).to be_equal result
      end
    end
  end

  describe 'converting one currency into another' do
    it 'returns the correct value based on the rate provided' do
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      result = bank.reduce(Money.franc(2), 'USD')
      expect(Money.dollar(1)).to be_equal result
    end
  end
end
