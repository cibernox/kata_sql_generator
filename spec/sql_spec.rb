require 'sql'

describe Sql do

  describe "#select" do
    it "requires a table to perform the selection" do
      expect { Sql.select(:name).to_sql }.to raise_error Sql::NoTableException
    end

    it "can specify a table name" do
      Sql.select.from('users').to_sql.should == "select * from users"
    end

    it "can specify the columns I want" do
      Sql.select(:name, 'age').from('users').to_sql.should == "select name, age from users"
    end

    it "accepts where clausules" do
      query = Sql.select(:age).from('users').where("age > 20").where(name: 'juan', city: 'Barcelona')
      query.to_sql.should == "select age from users where (age > 20) AND (name = 'juan' AND city = 'Barcelona')"
    end
  end

  describe "#insert" do
    it "requires a table to perform the insertion" do
      expect { Sql.insert(name: 'juan').to_sql }.to raise_error Sql::NoTableException
    end

    it "requires data to perform the insertion" do
      expect { Sql.insert.into(:users).to_sql }.to raise_error Sql::NoDataException
    end

    it "can specify the columns I want" do
      Sql.insert(name: 'juan', age: 23).into('users').to_sql.should == "insert into users (name, age) values ('juan', 23)"
    end

    it "accepts where clausules" do
      query = Sql.insert(age: 23).into('users').where("age > 20").where(name: 'juan', city: 'Barcelona')
      query.to_sql.should == "insert into users (age) values (23) where (age > 20) AND (name = 'juan' AND city = 'Barcelona')"
    end
  end

  describe "#delete" do
    it "requires a table to perform the deletion" do
      expect { Sql.delete.to_sql }.to raise_error Sql::NoTableException
    end

    it "can specify the table I want" do
      Sql.delete.from('users').to_sql.should == "delete from users"
    end

    it "accepts where clausules" do
      query = Sql.delete.from('users').where("age > 20").where(name: 'juan', city: 'Barcelona')
      query.to_sql.should == "delete from users where (age > 20) AND (name = 'juan' AND city = 'Barcelona')"
    end
  end

  describe "#update" do
    it "requires a table to perform the update" do
      expect { Sql.update.to_sql }.to raise_error Sql::NoTableException
    end

    it "requires data to perform the update" do
      expect { Sql.update('users').to_sql }.to raise_error Sql::NoDataException
    end


    it "can specify the table and data" do
      Sql.update('users').set(name: 'Jane', age: 27).to_sql.should == "update users set (name, age) values ('Jane', 27)"
    end

    it "accepts where clausules" do
      query = Sql.update('users').set(name: 'Jane', age: 27).where("age > 20").where(name: 'juan', city: 'Barcelona')
      query.to_sql.should == "update users set (name, age) values ('Jane', 27) where (age > 20) AND (name = 'juan' AND city = 'Barcelona')"
    end
  end

end