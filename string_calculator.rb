# string_calculator.rb
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter, numbers = extract_delimiter(numbers)
    numbers = normalize_input(numbers)
    pattern = Regexp.union(delimiter)
    parts = numbers.split(pattern)
    validate_format(parts)
    nums = parts.map(&:to_i)
    nums.select! { |n| n <= 1000 }
    validate_negatives(nums)

    nums.sum
  end

  def self.validate_format(parts)
    raise ArgumentError, "Invalid input format" if parts.any?(&:empty?)
  end

  def self.normalize_input(numbers)
    numbers.strip.gsub(' ', '')
  end

  def self.extract_delimiter(nums)
    return [[',', "\n"], nums] unless nums.start_with?('//')

    header, numbers = nums.split("\n", 2)

    delimiters = header.scan(/\[(.*?)\]/).flatten
    delimiters = [header[2..]] if delimiters.empty?

    [delimiters, numbers]
  end

  def self.validate_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    raise "negatives not allowed #{negatives.join(',')}" unless negatives.empty?
  end
end
