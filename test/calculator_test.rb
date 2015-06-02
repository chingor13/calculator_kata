require 'test_helper'

class CalculatorTest < Minitest::Test

  def setup
    super
    @calculator = StringCalculator::Calculator.new
  end

  def test_can_handle_bad_input
    assert_raises ArgumentError do
      @calculator.add(nil)
    end
  end

  def test_can_add_with_no_parameters
    assert_equal 0, @calculator.add("")
  end

  def test_can_add_one_number
    assert_equal 3, @calculator.add("3")
  end

  def test_can_add_two_numbers
    assert_equal 5, @calculator.add("3,2")
    assert_equal 7, @calculator.add("2,5")
  end

  def test_can_add_arbitrary_number_of_integers
    # pick a random number between 10 and 500 and we'll sum all numbers from 1
    #   to that number and assert that the sum is correct
    max = Random.new.rand(490) + 10
    numbers = 1.upto(max).to_a.join(",")

    # the sum of 1..n = n(n+1)/2 by math
    expected = max * (max + 1) / 2
    assert_equal expected, @calculator.add(numbers)
  end

  def test_can_handle_newlines
    assert_equal 6, @calculator.add("1\n2,3")
  end

  def test_can_declare_delimiter
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_no_negative_numbers
    assert_raises ArgumentError do
      @calculator.add("1,-2")
    end
  end

  def test_negative_number_error_lists_numbers
    begin
      @calculator.add("1,-2,4,-63")
      assert false, "should not get here"
    rescue ArgumentError => e
      assert_equal "negatives not allowed: -2,-63", e.message
    end
  end

end