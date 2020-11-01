require 'pair'

RSpec.describe Pair do
  let(:rates) do
    {}
  end

  it 'is hashable' do
    pair = Pair.new(from: 'USD', to: 'BRL')
    rates.store(pair, 6)

    expect(rates[Pair.new(from: 'USD', to: 'BRL')]).to eq 6
  end
end
