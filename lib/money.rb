class Money
  class << self
    def dollar(amount)
      Dollar.new(amount)
    end

    def franc(amount)
      Franc.new(amount)
    end
  end

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def equal?(money)
    amount == money.amount &&
      self.class == money.class
  end
end
