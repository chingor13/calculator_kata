require 'test_helper'

class DelimiterParserTest < Minitest::Test

  def setup
    super
    @parser = StringCalculator::DelimiterParser.new
  end

  def test_can_parse_single_character
    delimiters = StringCalculator::DelimiterParser.detect("//;")
    assert_equal [";"], delimiters
  end

  def test_can_detect_multiple_character_delimiters
    delimiters = StringCalculator::DelimiterParser.detect("//[***]")
    assert_equal ["***"], delimiters
  end

  def test_can_split_on_multiple_delimiters
    assert_equal ["1","2","3","4"], StringCalculator::DelimiterParser.split("1;2,3***4", ["***", ",", ";"])
  end

end