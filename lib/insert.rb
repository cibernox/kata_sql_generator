require 'with_data'

module Sql
  class Insert < Statement
    include WithData
    alias_method :into, :table

    def initialize(data = nil)
      set_data data
    end

    def to_sql
      where_str = super
      raise NoDataException unless @columns && @columns.any?
      "insert into #{@table} (#{@columns}) values (#{@values})" << where_str
    end
  end
end