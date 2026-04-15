# spec/string_calculator_spec.rb
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  it 'returns 0 for empty string' do
    expect(StringCalculator.add('')).to eq(0)
  end
  it 'returns number when single number is provided' do
    expect(StringCalculator.add('1')).to eq(1)
  end
end
