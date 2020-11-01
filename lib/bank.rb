require 'pair'

class Bank
  attr_reader :rates

  def initialize(rates = {})
    @rates = rates
  end

  def reduce(expression, to)
    expression.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates.store(Pair.new(from: from, to: to), rate)
  end

  def rate(from, to)
    return 1 if from == to
    rates[Pair.new(from: from, to: to)]
  end
end
