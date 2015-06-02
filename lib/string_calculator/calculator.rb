module StringCalculator
  class Calculator

    # numbers should be a comma separated list of numbers
    def add(numbers)
      numbers.split(",").map(&:to_i).inject(0, &:+)
    end

  end
end