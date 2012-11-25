require 'sql_helpers'
module Sql
  class Statement

    def table(table)
      @table = table
      self
    end

    def where(cond)
      @conditions ||= []
      if cond.is_a?(String)
        @conditions << "(#{cond})"
      else
        @conditions << "(" + cond.map { |k,v| "#{k} = #{Value.new(v)}" }.join(' AND ') + ")"
      end
      self
    end

    def to_sql
      raise NoTableException unless @table
      if @conditions && @conditions.any?
        " where #{@conditions.join(' AND ')}"
      else
        ""
      end
    end
  end

end