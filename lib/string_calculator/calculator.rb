module StringCalculator
  class Calculator
    DELIMITER_PATTERN = /^\/\/(.)$/

    # numbers should be a comma separated list of numbers
    def add(numbers)
      raise ArgumentError, "numbers must be a string" unless numbers.is_a?(String)

      delimiter = /[,\n]/
      lines = numbers.split("\n")

      if lines.length > 0 && match = lines.first.match(DELIMITER_PATTERN)
        delimiter = Regexp.new(match[1])
        numbers = lines[1..-1].join("\n")
      end

      numbers.split(delimiter).map(&:to_i).inject(0, &:+)
    end

  end
end