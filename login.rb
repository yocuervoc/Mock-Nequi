require_relative 'connection.rb'

class Login

  attr_accessor :email, :password

  def initialize(email, password)
    @db_connection = DbConnection.new()
    @email = email
    @password = password

  end

  def log

    result = @db_connection.client.query("select id from users where mail=\"#{email}\" limit 1;", :symbolize_keys => true)
    id_user=nil
    result.each do |row|
      id_user =row[:id]
    end
    if id_user.class == Integer
      puts "succeful transaction"
      return id_user
    else
      puts "usuario no encontrado"
    end

  end

end
