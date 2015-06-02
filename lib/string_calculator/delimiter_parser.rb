module StringCalculator
  class DelimiterParser
    DELIMITER_PATTERN = /^\/\/(.)$/

    class << self
      def detect(string)
        return unless string.is_a?(String)
        return unless match = string.match(DELIMITER_PATTERN)

        Regexp.new(match[1])
      end

      def parse(string, default_delimiter)
        definition, *rest = string.split("\n")

        unless delimiter = detect(definition)
          delimiter = default_delimiter
          rest.unshift(definition)
        end

        [delimiter, rest.join("\n")]
      end
    end
  end
end