module StringCalculator
  class Calculator
    DEFAULT_DELIMITER = /[,\n]/

    # numbers should be a comma separated list of numbers
    def add(numbers)
      raise ArgumentError, "numbers must be a string" unless numbers.is_a?(String)

      delimiter, numbers = DelimiterParser.parse(numbers, DEFAULT_DELIMITER)

      # number validator
      real_numbers = numbers.split(delimiter).map(&:to_i)
      negatives = real_numbers.select do |num|
        num < 0
      end
      raise ArgumentError, "negatives not allowed: #{negatives.join(",")}" if negatives.length > 0

      # number rejector
      real_numbers.reject! do |num|
        num > 1000
      end

      real_numbers.inject(0, &:+)
    end

  end
end