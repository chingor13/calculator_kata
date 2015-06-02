module StringCalculator
  class DelimiterParser
    DELIMITER_PATTERN = /^\/\/(.*)$/

    class << self
      def detect(string)
        return unless string.is_a?(String)
        return unless match = string.match(DELIMITER_PATTERN)

        case match[1]
        when /^.$/
          [match[1]]
        else
          match[1].scan(/\[([^\]]+)\]/).flatten
        end
      end

      def parse(string, default_delimiter)
        definition, *rest = string.split("\n")

        unless delimiter = detect(definition)
          delimiter = default_delimiter
          rest.unshift(definition)
        end

        [delimiter, rest.join("\n")]
      end

      def split(string, delimiters)
        results = [string]
        delimiters.each do |delimiter|
          results.map! {|str| str.split(delimiter) }.flatten!
        end
        results
      end
    end
  end
end