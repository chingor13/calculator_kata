module StringCalculator
  class Calculator
    DEFAULT_DELIMITERS = [",", "\n"]

    # numbers should be a comma separated list of numbers
    def add(numbers)
      raise ArgumentError, "numbers must be a string" unless numbers.is_a?(String)

      definition, *rest = numbers.split("\n")
      unless delimiters = DelimiterParser.detect(definition)
        delimiters = DEFAULT_DELIMITERS
        rest.unshift(definition)
      end

      numbers = DelimiterParser.split(rest.join("\n"), delimiters)

      # number validator
      real_numbers = numbers.map(&:to_i)
      negatives = real_numbers.select do |num|
        num < 0
      end
      raise ArgumentError, "negatives not allowed: #{negatives.join(",")}" if negatives.length > 0

      # number rejector
      real_numbers.reject! do |num|
        num > 1000
      end

      # do the sum
      real_numbers.inject(0, &:+)
    end

  end
end