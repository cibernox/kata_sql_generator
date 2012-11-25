module Sql

  class Select < Statement
    alias_method :from, :table

    def initialize(columns)
      columns << '*' if columns.empty?
      @columns = ColumnsList.new(columns)
    end


    def to_sql
      "select #{@columns} from #{@table}" << super
    end
  end

end