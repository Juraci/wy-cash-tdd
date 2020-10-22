class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end
  
  def equal?(money)
    amount == money.amount
  end
end
