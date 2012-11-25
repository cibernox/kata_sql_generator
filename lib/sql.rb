require 'sql_statement'
require 'delete'
require 'select'
require 'insert'
require 'update'

module Sql
  class NoTableException < StandardError; end
  class NoDataException < StandardError; end

  # CLASS METHODS

  def self.select(*columns)
    Select.new columns
  end

  def self.insert(data = nil)
    Insert.new data
  end

  def self.delete
    Delete.new
  end

  def self.update(table = nil)
    Update.new(table)
  end

end