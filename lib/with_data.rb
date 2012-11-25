module Sql
  module WithData
    def set_data(data = nil)
      if data.respond_to? :keys
        @columns, @values = ColumnsList.new(data.keys), ValuesList.new(data.values)
      end
      self
    end
  end
end