require_relative 'connection.rb'
require_relative 'user.rb'
require_relative 'login.rb'

class Modifier

	def initialize(email, password)
		@email = email
		@password = password
		@db_connection = DbConnection.new()
	end

	def add_money_account(amount)
		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end

		result = @db_connection.client.query("UPDATE accounts SET disponible = disponible + #{amount} WHERE id = #{id_count};", :symbolize_keys => true)


	end

	def withdraw_money(amount)
#############
sesion=Login.new(@email, @password)
id_user = sesion.log
result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
id_count=999999
result.each do |row|
	id_count= row[:accounts_id]
end

result = @db_connection.client.query("select disponible from accounts where id = #{id_count};", :symbolize_keys => true)
disponible=999999
result.each do |row|
	disponible= row[:disponible]
end
 if amount <= disponible
	 result = @db_connection.client.query("UPDATE accounts SET disponible = disponible - #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
 else
	 puts "transaccion invalida, NO MONEY"
 end


#####
	end

	def send_money(send_to, amount)

		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end

		result = @db_connection.client.query("select disponible from accounts where id = #{id_count};", :symbolize_keys => true)
		disponible=0
		result.each do |row|
			disponible= row[:disponible]
		end

		result = @db_connection.client.query("select accounts_id from users where mail =\'#{send_to}\';", :symbolize_keys => true)
		send=""
		result.each do |row|
			send= row[:accounts_id]
			puts row[:accounts_id]
		end

		if disponible >= amount
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible - #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible + #{amount} WHERE id = #{send};", :symbolize_keys => true)

		else
			puts "transaccion invalida, NO MONEY"
		end

	end

	def add_money_mattress(amount)

				sesion=Login.new(@email, @password)
				id_user = sesion.log

				result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
				id_count=999999
				result.each do |row|
					id_count= row[:accounts_id]
					puts row[:accounts_id]
				end

				result = @db_connection.client.query("select disponible from accounts where id = #{id_count};", :symbolize_keys => true)
				disponible=0
				result.each do |row|
					disponible= row[:disponible]
				end

				if disponible >= amount
					result = @db_connection.client.query("UPDATE accounts SET disponible = disponible - #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
					result = @db_connection.client.query("UPDATE accounts SET mattress = mattress + #{amount} WHERE id = #{id_count};", :symbolize_keys => true)

				else
					puts "transaccion invalida, NO MONEY"
				end
	end

	def withdraw_money_mattress(amount)
		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end

		result = @db_connection.client.query("select mattress from accounts where id = #{id_count};", :symbolize_keys => true)
		disponible=0
		result.each do |row|
			disponible= row[:mattress]
		end

		if disponible >= amount
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible + #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
			result = @db_connection.client.query("UPDATE accounts SET mattress = mattress - #{amount} WHERE id = #{id_count};", :symbolize_keys => true)

		else
			puts "transaccion invalida, NO MONEY"
		end
	end

	def add_money_pocket(nombre_pocket, amount)
		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end

		result = @db_connection.client.query("select id from pockets where name = \'#{nombre_pocket}\';", :symbolize_keys => true)
		id_pocket=nil
		result.each do |row|
			id_pocket= row[:id]

		end

		result = @db_connection.client.query("select disponible from accounts where id = #{id_count};", :symbolize_keys => true)
		disponible=0
		result.each do |row|
			disponible= row[:disponible]
		end

		if disponible >= amount
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible - #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
			result = @db_connection.client.query("UPDATE pockets SET pocketMoney = pocketMoney + #{amount} WHERE id = #{id_pocket};", :symbolize_keys => true)
		else
			puts "transaccion invalida, NO MONEY"
		end
	end

	def withdraw_money_pocket(nombre_pocket, amount)
		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end

		result = @db_connection.client.query("select id from pockets where name = \'#{nombre_pocket}\';", :symbolize_keys => true)
		id_pocket=nil
		result.each do |row|
			id_pocket= row[:id]

		end

		result = @db_connection.client.query("select pocketMoney from pockets where id = #{id_pocket};", :symbolize_keys => true)
		disponible=0
		result.each do |row|
			disponible= row[:pocketMoney]
		end

		if disponible >= amount
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible + #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
			result = @db_connection.client.query("UPDATE pockets SET pocketMoney = pocketMoney - #{amount} WHERE id = #{id_pocket};", :symbolize_keys => true)
		else
			puts "transaccion invalida, NO MONEY"
		end
	end

	def send_money_pocket(nombre_pocket, amount)
		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end

		result = @db_connection.client.query("select id from pockets where name = \'#{nombre_pocket}\';", :symbolize_keys => true)
		id_pocket=nil
		result.each do |row|
			id_pocket= row[:id]

		end

		result = @db_connection.client.query("select pocketMoney from pockets where id = #{id_pocket};", :symbolize_keys => true)
		disponible=0
		result.each do |row|
			disponible= row[:pocketMoney]
		end

		if disponible >= amount
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible + #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
			result = @db_connection.client.query("UPDATE pockets SET pocketMoney = pocketMoney - #{amount} WHERE id = #{id_pocket};", :symbolize_keys => true)
		else
			puts "transaccion invalida, NO MONEY"
		end
	end

	def add_money_goal(amount, name_goal)

		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user};", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:accounts_id]
		end

		result = @db_connection.client.query("select id from goals where name = \'#{name_goal}\';", :symbolize_keys => true)
		id_goal=nil
		result.each do |row|
			id_goal= row[:id]
		end

		result = @db_connection.client.query("select disponible from accounts where id = #{id_count};", :symbolize_keys => true)
		disponible=0
		result.each do |row|
			disponible= row[:disponible]
		end

		if disponible >= amount
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible - #{amount} WHERE id = #{id_count};", :symbolize_keys => true)
			result = @db_connection.client.query("UPDATE goals SET savedMoney = savedMoney + #{amount} WHERE id = #{id_goal};", :symbolize_keys => true)
		else
			puts "transaccion invalida, NO MONEY"
		end

	end
end
#3
	m= Modifier.new("yocc@gmail.com", "pasw0rd")
	#m.add_money_mattress(5)
	#m.withdraw_money_mattress(2)
	#m.add_money_pocket("carro", 67)
	#m.send_money_pocket("carro", 40)
	#m.send_money("orlando@gmail.com", 135)
	#m.add_money_account(1000)
	#m.withdraw_money(80)
	#m.add_money_goal(43, "viaje")
	m.withdraw_money_pocket("carro", 9)
