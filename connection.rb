require 'mysql2'

class DbConnection

  attr_reader :client

  def initialize
    @client = Mysql2::Client.new(
        host:'localhost',
        username:'root',
        password:'dracarys',
        port:'3306',
        database:'mydb'
    )
  end
  def query(mydb)
    results = @client.query(mydb)
    return  results
  end
end
