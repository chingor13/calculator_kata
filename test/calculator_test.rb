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

end