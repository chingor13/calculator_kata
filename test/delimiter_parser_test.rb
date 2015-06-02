require 'test_helper'

class DelimiterParserTest < Minitest::Test

  def setup
    super
    @parser = StringCalculator::DelimiterParser.new
  end

  def test_can_parse_single_character
    delimiter = StringCalculator::DelimiterParser.detect("//;")
    assert_equal /;/, delimiter
  end

end