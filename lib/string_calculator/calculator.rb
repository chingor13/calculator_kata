module StringCalculator
  class Calculator

    # numbers should be a comma separated list of numbers
    def add(numbers)
      raise ArgumentError, "numbers must be a string" unless numbers.is_a?(String)
      numbers.split(/[,\n]/).map(&:to_i).inject(0, &:+)
    end

  end
end