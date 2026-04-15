# string_calculator.rb
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)

    numbers = numbers.gsub('\n', delimiter)
    nums = numbers.split(delimiter).map(&:to_i)

    validate_negatives(nums)

    nums.sum
  end

  def self.extract_delimiter(numbers)
    return [',', numbers] unless numbers.start_with?('//')

    parts = numbers.split("\n")
    [parts[0][2], parts[1]]
  end

  def self.validate_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    raise "negatives not allowed #{negatives.join(',')}" unless negatives.empty?
  end
end
