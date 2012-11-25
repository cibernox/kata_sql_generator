module Sql
  class Delete < Statement
    alias_method :from, :table

    def to_sql
      "delete from #{@table}" << super
    end
  end
end