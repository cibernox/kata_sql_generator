module Sql

  class Update < Statement
    include WithData
    alias_method :set, :set_data

    def initialize(table)
      self.table table
    end

    def to_sql
      where_str = super
      raise NoDataException unless @columns && @columns.any?
      "update #{@table} set (#{@columns}) values (#{@values})" << where_str
    end
  end

end