require_relative 'connection.rb'
require_relative 'login.rb'

class Query

	def initialize(user)

		@email = user.email
		@password = user.password
		@db_connection = DbConnection.new()
		@sesion=Login.new(user)
		@id_user = @sesion.log
	end

	def total_balance_query
		result = @db_connection.client.query("select total from accounts where id = #{@id_user};")
		total = nil
		result.each do |row|
			total = row["total"]
		end
		return total

	end

	def available_balance_query
		result = @db_connection.client.query("select disponible from accounts where id = #{@id_user};")
		disponible = nil
		result.each do |row|
			disponible = row["disponible"]
		end
		return disponible

	end

	def transactions_query
		result = @db_connection.client.query("select * from transaction where accounts_id = #{@id_user};")
	end

	def mattress_money_query
		result = @db_connection.client.query("select mattress from accounts where id = #{@id_user};")
		mattress = nil
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
		result.each do |row|
			puts row
		end

	end

	def goals_list
		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user};", :symbolize_keys => true)
		id_count=nil
		result.each do |row|
			id_count= row[:accounts_id]
		end
		result = @db_connection.client.query("select name, date, savedMoney, totalAmount, from goals where accounts_id = #{id_count};")
		result.each do |row|
			puts row
		end

	end

end
