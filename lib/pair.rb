class Pair
  attr_reader :from, :to

  def initialize(from:, to:)
    @from = from
    @to = to
  end

  def eql?(pair)
    from == pair.from &&
      to == pair.to
  end

  def hash
    [from, to].hash
  end
end
