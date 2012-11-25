module Sql

  # Wraps a simple sql value.
  # Supports Integer, String and Boolean
  class Value
    def initialize(value)
      @value = value
    end

    def to_s
      if @value.is_a?(String) || @value.is_a?(Symbol)
        "'#{@value}'"
      else
        @value.to_s.upcase
      end
    end
  end

  class ValuesList < Array
    def initialize(values)
      super values.map{ |val| Value.new(val) }
    end

    def to_s
      join(', ')
    end
  end

  class ColumnsList < Array
    def to_s
      join(', ')
    end
  end

end