require_relative 'connection.rb'
require_relative 'login.rb'

class Query

	def initialize(email password)

		@email = email
		@password = password
		@db_connection = DbConnection.new()
		@sesion=Login.new(email, password)
		@id_user = @sesion.log
	end

	def total_balance_query
		result = @db_connection.client.query("select total from accounts where id = #{@id_user};")
		total = nil
		result.each do |row|
			total = row["total"]
		end
		puts "Total: #{total}"

	end

	def available_balance_query
		result = @db_connection.client.query("select disponible from accounts where id = #{@id_user};")
		disponible = nil
		result.each do |row|
			disponible = row["disponible"]
		end

		puts "Disponible: #{disponible}"

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

		puts "Colchon: #{mattress}"

	end

	def pockets_list
		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user};", :symbolize_keys => true)
		id_count=999999
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
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end
		result = @db_connection.client.query("select name, date, savedMoney, totalAmount, from goals where accounts_id = #{id_count};")
		result.each do |row|
			puts row
		end

	end

end
