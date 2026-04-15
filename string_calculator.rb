# string_calculator.rb
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ','

    if numbers.start_with?('//')
      parts = numbers.split("\n")
      delimiter = parts[0][2]
      numbers = parts[1]
    end

    numbers = numbers.gsub('\n', delimiter)
    numbers.split(delimiter).map(&:to_i).sum
  end
end
