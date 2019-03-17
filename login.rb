require_relative 'connection.rb'
require 'digest'

class Login

  attr_accessor :email, :password

  def initialize(email, password)
    @db_connection = DbConnection.new()
    @email = email
    @password = Digest::SHA1.hexdigest password

  end

  def log
    puts "email #{email}"
    puts "pss #{password}"
    result = @db_connection.client.query("select id from users where mail=\"#{email}\" and password= \'#{password}\' limit 1;", :symbolize_keys => true)
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
