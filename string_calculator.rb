class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    delim_pattern = /,|\n/
    num_string = numbers

    # Custom delimiter
    if numbers.start_with?('//')
      delimiter_section, num_string = numbers.split("\n", 2)
      p '==================='
      p numbers
      p delimiter_section
      p num_string
      p '==================='
      if delimiter_section.match(/\[.*\]/)
        # Multiple or multi-character delimiters
        delimiters = delimiter_section.scan(/\[(.*?)\]/).flatten
        pattern = delimiters.map { |d| Regexp.escape(d) }.join('|')
        delim_pattern = /#{pattern}|\n/
      else
        single_delim = Regexp.escape(delimiter_section[2..])
        delim_pattern = /#{single_delim}|\n/
      end
    end

    nums = num_string.split(delim_pattern).map(&:to_i)

    negatives = nums.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    nums.sum
  end
end
