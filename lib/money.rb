class Money
  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end

  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equal?(money)
    amount == money.amount &&
      currency == money.currency
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end
end
