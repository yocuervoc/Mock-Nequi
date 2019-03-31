require_relative 'connection.rb'
require 'digest'
class Login

  attr_accessor :email, :password, :db_connection

  def initialize(user)
    @db_connection = DbConnection.new()
    @user_name = user.name
    @email = user.email
    @password =  Digest::SHA1.hexdigest user.password

  end

  def log
    result = @db_connection.client.query("select id from users where mail=\"#{email}\" and password= \'#{password}\' limit 1;", :symbolize_keys => true)
    id_user=nil
    result.each do |row|
      id_user =row[:id]
    end
    return id_user
  end

end
