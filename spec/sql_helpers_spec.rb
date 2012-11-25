require 'sql_helpers'

describe Sql::ColumnsList do
  it "prints the colums separated by commas" do
    Sql::ColumnsList.new([:name, 'age']).to_s.should == "name, age"
  end
end

describe Sql::ValuesList do
  it "wraps string values in single quotes, upcases booleans and joins with commas" do
    text = Sql::ValuesList.new([:john, 'smith', 23, true, false]).to_s
    text.should == "'john', 'smith', 23, TRUE, FALSE"
  end
end
