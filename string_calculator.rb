# string_calculator.rb
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)

    pattern = Regexp.union(delimiter)
    nums = numbers.split(pattern).map(&:to_i)

    validate_negatives(nums)

    nums.sum
  end

  def self.extract_delimiter(numbers)
    return [[',', "\n"], numbers] unless numbers.start_with?('//')

    header, numbers = numbers.split("\n", 2)

    delimiters = header.scan(/\[(.*?)\]/).flatten
    delimiters = [header[2..]] if delimiters.empty?

    [delimiters, numbers]
  end

  def self.validate_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    raise "negatives not allowed #{negatives.join(',')}" unless negatives.empty?
  end
end
