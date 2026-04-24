# spec/string_calculator_spec.rb
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'when input is empty' do
      it 'returns 0' do
        expect(described_class.add('')).to eq(0)
      end
    end

    context 'when input has single number' do
      it 'returns the number' do
        expect(described_class.add('1')).to eq(1)
      end
    end

    context 'when input has multiple numbers' do
      it 'returns sum of comma separated numbers' do
        expect(described_class.add('1,2')).to eq(3)
      end

      it 'handles new lines between numbers' do
        expect(described_class.add("1\n2,3")).to eq(6)
      end
    end

    context 'when using custom delimiters' do
      it 'supports single delimiter' do
        expect(described_class.add("//;\n1;2")).to eq(3)
      end

      it 'supports multiple delimiters' do
        expect(described_class.add("//[*][%]\n1*2%3")).to eq(6)
      end

      it 'supports long delimiters' do
        expect(described_class.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'when negative numbers are present' do
      it 'raises error for one negative number' do
        expect { described_class.add('1,-2') }
          .to raise_error('negatives not allowed -2')
      end

      it 'raises error showing all negative numbers' do
        expect { described_class.add('1,-2,-3') }
          .to raise_error('negatives not allowed -2,-3')
      end
    end

    context 'when numbers are greater than 1000' do
      it 'ignores numbers greater than 1000' do
        expect(described_class.add('2,1001')).to eq(2)
      end
    end

    context 'when input is malformed' do
      it 'raises error for leading delimiter' do
        expect { described_class.add(',1,2') }
          .to raise_error(ArgumentError)
      end

      it 'raises error for consecutive delimiters' do
        expect { described_class.add('1,,2') }
          .to raise_error(ArgumentError)
      end
    end
  end
end
