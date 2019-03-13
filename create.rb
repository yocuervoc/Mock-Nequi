require_relative 'connection.rb'
require_relative 'user.rb'

class Creation

	def initialize
		@db_connection = DbConnection.new()
	end
	
	def register_user(name, password, email)
		current_user = User.new( name, password, email)
		succeful_access = @db_connection.client.query("INSERT INTO accounts (disponible,mattress, total) VALUES (0,0,0);", :symbolize_keys => true)
		result = @db_connection.client.query("select id from accounts order by id desc limit 1;", :symbolize_keys => true)
		result.each do |row|
			puts row
		end
	end

	def create_pocketspassword

	end

	def delete_pockets
		
	end

	def create_goals
		
	end

	def delete_goals
		
	end

end

test = Creation.new()
test.register_user("oscar", "password", "iasj@gmail.com")