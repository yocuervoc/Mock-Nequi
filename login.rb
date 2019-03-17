require_relative 'connection.rb'
require 'digest'

class Login

  attr_accessor :email, :password

  def initialize(user)
    @db_connection = DbConnection.new()
    @email = user.email
    @password = Digest::SHA1.hexdigest user.password

  end

  def log
    result = @db_connection.client.query("select id from users where mail=\"#{email}\" and password= \'#{password}\' limit 1;", :symbolize_keys => true)
    id_user=nil
    result.each do |row|
      id_user =row[:id]
    end
=begin
    if id_user.class == Integer
      puts "succeful transaction"
      return id_user
    else
      puts "usuario no encontrado"
    end
=end
  end

end
