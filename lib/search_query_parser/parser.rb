require "search_query_parser/version"

module SearchQueryParser

  QUOTE = '"'.freeze
  MODE_IN_KEY = 1
  MODE_IN_VALUE = 2

  class Query
    attr_reader :fields, :texts

    def initialize()
      @fields = {} # key=[value1, value2 ..]
      @texts = []  # [value1, value2 ..]
    end
  end

  class QueryParseError < StandardError
    def initialize(query, cause)
      super "Can not parse '#{query}': #{cause}"
    end
  end

  def parse(query, key_value_separator: ':', field_separator: ' ')
    key_buf, value_buf, mode, in_quote = [], [], MODE_IN_KEY, false

    dest = Query.new
    query.strip.split('').each do |c|
      if c == key_value_separator && !in_quote
        raise QueryParseError.new(query, "section maybe starts with \"#{key_value_separator}\"") if key_buf.empty?
        raise QueryParseError.new(query, "section maybe not in 'key:value' format") unless value_buf.empty?
        mode = MODE_IN_VALUE
      elsif c == field_separator && !in_quote
        apply(dest, key_buf, value_buf)
        key_buf, value_buf, mode = [], [], MODE_IN_KEY
      elsif c == QUOTE
        in_quote = !in_quote
      else
        (mode == MODE_IN_KEY ? key_buf : value_buf) << c
      end
    end
    raise QueryParseError.new(query, "#{QUOTE} is not closed") if in_quote
    apply(dest, key_buf, value_buf)

    dest
  end

  private
  def apply(dest, key_buf, value_buf)
    if value_buf.size > 0
      key = key_buf.join('')
      dest.fields[key] ||= []
      dest.fields[key] << value_buf.join('')
    elsif key_buf.size > 0
      dest.texts << key_buf.join('')
    end
    dest
  end

  module_function :parse, :apply
end
