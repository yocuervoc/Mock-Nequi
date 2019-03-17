require_relative 'connection.rb'
require_relative 'user.rb'
require_relative 'login.rb'
require 'digest'

class Creation

	def initialize(user)
		@user_name= user.name
		@password = Digest::SHA1.hexdigest user.password
		@email = user.email
		@db_connection = DbConnection.new()

		@sesion=Login.new(user)
		@id_user = @sesion.log

	end

	def register_user
		current_user = User.new(@user_name, @email, @password)
		succeful_access = @db_connection.client.query("insert into accounts (disponible,mattress, total) values (0,0,0);", :symbolize_keys => true)
		result = @db_connection.client.query("select id from accounts order by id desc limit 1;", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:id]
		end

		succeful_access = @db_connection.client.query("insert into users(mail, password, accounts_id ) values (\"#{current_user.email}\",\"#{ current_user.password}\", #{id_count});", :symbolize_keys => true)

	end

	def create_pocket(pocket_name)

		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user} ;", :symbolize_keys => true)
		accounts_id=999999
		result.each do |row|
			accounts_id=row[:accounts_id]
		end

		succeful_access = @db_connection.client.query("insert into pockets(pocketMoney, name, accounts_id ) values (0.0, \"#{pocket_name}\",  #{accounts_id});", :symbolize_keys => true)

	end

	def delete_pocket(name_pocket)

		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user};", :symbolize_keys => true)
		accounts_id=999999
		result.each do |row|
			accounts_id=row[:accounts_id]
		end

		result = @db_connection.client.query("select id from pockets where name = \'#{name_pocket}\' and accounts_id = #{accounts_id};", :symbolize_keys => true)
		id_pocket=nil
		result.each do |row|
			id_pocket= row[:id]
		end

		result = @db_connection.client.query("select pocketMoney from pockets where id = \'#{id_pocket}\'", :symbolize_keys => true)
		pocketMoney=nil
		result.each do |row|
			pocketMoney= row[:pocketMoney]
		end

		if id_pocket.class == Integer
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible + #{pocketMoney} WHERE id = #{accounts_id};", :symbolize_keys => true)
			result = @db_connection.client.query("delete from pockets where id = \'#{id_pocket}\' limit 1", :symbolize_keys => true)
		else
			puts "bolsillo no encontrado"
		end

	end

	def create_goals(name, date, totalAmount )

		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user} ;", :symbolize_keys => true)
		accounts_id=999999

		result.each do |row|
			accounts_id=row[:accounts_id]
		end
		result = @db_connection.client.query("insert into goals (name, date, totalAmount, fulfilled, savedMoney, accounts_id ) values (\'#{name}\', \'#{date}\', #{totalAmount}, 0, 0, #{accounts_id});", :symbolize_keys => true)
	end

	def delete_goals(goal_name)

		result = @db_connection.client.query("select accounts_id from users where id = #{@id_user};", :symbolize_keys => true)
		accounts_id=999999
		result.each do |row|
			accounts_id=row[:accounts_id]
		end

		result = @db_connection.client.query("select id from goals where name = \'#{goal_name}\' and accounts_id = #{accounts_id};", :symbolize_keys => true)
		id_goal=nil
		result.each do |row|
			id_goal= row[:id]
		end

		result = @db_connection.client.query("select savedMoney from goals where id = \'#{id_goal}\'", :symbolize_keys => true)
		savedMoney=nil
		result.each do |row|
			savedMoney= row[:savedMoney]
			puts row
		end

		if id_goal.class == Integer
			result = @db_connection.client.query("UPDATE accounts SET disponible = disponible + #{savedMoney} WHERE id = #{accounts_id};", :symbolize_keys => true)
			result = @db_connection.client.query("delete from goals where id = \'#{id_goal}\' limit 1", :symbolize_keys => true)
		else
			puts "Meta no encontrada"
		end

	end

end

#test = Creation.new("Yonatan", "encrip2@gmail.com", "password3")
#test.register_user()
#test.create_pocket("carro")
=begin
test = Creation.new("yocc", "password3", "yocc@gmail.com")
test.register_user()
test.create_pocket("carro")
test.create_goals("viaje", "20210101", 3000, )


c=Creation.new("yocc","yocc@gmail.com", "pasw0rd")
c.delete_pocket("carro")
c.delete_goals("viaje")
=end
