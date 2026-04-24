# spec/string_calculator_spec.rb
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  it 'returns 0 for empty string' do
    expect(StringCalculator.add('')).to eq(0)
  end

  it 'returns number when single number is provided' do
    expect(StringCalculator.add('1')).to eq(1)
  end

  it 'returns sum of two numbers' do
    expect(StringCalculator.add('1,2')).to eq(3)
  end

  it 'handles new lines between numbers' do
    expect(StringCalculator.add("1\n2,3")).to eq(6)
  end

  it 'supports custom delimiter' do
    expect(StringCalculator.add("//;\n1;2")).to eq(3)
  end

  it 'raises exception for negative numbers' do
    expect { StringCalculator.add('1,-2') }
      .to raise_error('negatives not allowed -2')
  end

  it 'shows all negative numbers in exception' do
    expect { StringCalculator.add('1,-2,-3') }
      .to raise_error('negatives not allowed -2,-3')
  end

  it 'supports multiple delimiters' do
    expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it 'supports long delimiters' do
    expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
  end

  it 'Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2' do
    expect(StringCalculator.add("//[***]\n2***1001")).to eq(2)
  end
end
