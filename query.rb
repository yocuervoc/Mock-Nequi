require_relative 'connection.rb'
require_relative 'login.rb'

class Query

	attr_accessor :email, :password, :db_connection, :sesion, :id_user
	def initialize(user)

		@email = user.email
		@password = Digest::SHA1.hexdigest user.password
		@db_connection = DbConnection.new()
		@sesion=Login.new(user)
		@id_user = @sesion.log
		
	end

	def total_balance_query
		result = @db_connection.client.query("select a.total from accounts a join users u on u.accounts_id = a.id where u.id= #{@id_user};")
		total = 0
		result.each do |row|
			total = row["total"]
		end
		return total

	end

	def available_balance_query
		result = @db_connection.client.query("select a.disponible from accounts a join users u on u.accounts_id = a.id where u.id= #{@id_user};")
		disponible = 0
		result.each do |row|
			disponible = row["disponible"]
		end
		return disponible

	end

	def transactions_query
		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user};", :symbolize_keys => true)
		id_count=nil
		result.each do |row|
			id_count= row[:accounts_id]
		end

		list = ""
		result = @db_connection.client.query("select * from transactions where accounts_id = #{id_count};")
		result.each do |row|
			list = list + "#{row["description"]} \t #{row["value"]} \t #{row["date"]} \n"
		end

		return list
	end

	def mattress_money_query
		result = @db_connection.client.query("select a.mattress from accounts a join users u on u.accounts_id = a.id where u.id= #{@id_user};")
		mattress = 0
		result.each do |row|
			mattress = row["mattress"]
		end
		return mattress

	end

	def pockets_list
		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user};", :symbolize_keys => true)
		id_count=nil
		result.each do |row|
			id_count= row[:accounts_id]
		end
		result = @db_connection.client.query("select name, pocketMoney from pockets where accounts_id = #{id_count};")
		list = ""
		result.each do |row|
			list = list + "#{row["name"]} \t #{row["pocketMoney"]} \n"
		end
		return list

	end

	def goals_list
		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user};", :symbolize_keys => true)
		id_count=nil
		result.each do |row|
			id_count= row[:accounts_id]
		end
		result = @db_connection.client.query("select name, date, savedMoney, totalAmount from goals where accounts_id = #{id_count};")
		list = ""
		result.each do |row|
			list = list + "#{row["name"]} \t #{row["savedMoney"]} \t #{row["totalAmount"]} \n"
		end
		
		return list

	end

end
