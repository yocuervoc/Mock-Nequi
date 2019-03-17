require_relative 'connection.rb'

class TestSelect

  def initialize
    @db_connection = DbConnection.new()
  end

  def select_test


    results = @db_connection.client.query("show tables;", :symbolize_keys => true)
    puts results.class
    results.each do |row|
      puts row
    end

    headers = results.fields
    puts headers.class
    puts headers[0]
  end

  def insert_test
    @db_connection.query(";")
  end
end

#init
#object = TestSelect.new()
#object.select_test
