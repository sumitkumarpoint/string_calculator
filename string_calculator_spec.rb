require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  it 'returns 0 for empty string' do
    expect(calc.add('')).to eq(0)
  end

  it 'returns number for single input' do
    expect(calc.add('1')).to eq(1)
  end

  it 'returns sum of two numbers' do
    expect(calc.add('1,5')).to eq(6)
  end

  it 'handles newlines between numbers' do
    expect(calc.add("1\n2,3")).to eq(6)
  end

  it 'raises error for negative numbers' do
    expect { calc.add('1,-2,3,-4') }
      .to raise_error(ArgumentError, 'negative numbers not allowed: -2,-4')
  end
end
