require_relative 'connection.rb'
require_relative 'user.rb'
require_relative 'login.rb'

class Creation

	def initialize(user_name, password, email)
		@user_name= user_name
		@password = password
		@email = email
		@db_connection = DbConnection.new()
	end

	def register_user()
		current_user = User.new(@user_name, @password, @email)
		succeful_access = @db_connection.client.query("insert into accounts (disponible,mattress, total) values (0,0,0);", :symbolize_keys => true)
		result = @db_connection.client.query("select id from accounts order by id desc limit 1;", :symbolize_keys => true)
		id_count=999999
		result.each do |row|
			id_count= row[:id]
		end

		succeful_access = @db_connection.client.query("insert into users(mail, password, accounts_id ) values (\"#{current_user.email}\",\"#{ current_user.password}\", #{id_count});", :symbolize_keys => true)

	end

	def create_pocket(pocket_name)

		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user} ;", :symbolize_keys => true)
		accounts_id=999999
		result.each do |row|
			accounts_id=row[:accounts_id]
		end

		succeful_access = @db_connection.client.query("insert into pockets(pocketMoney, name, accounts_id ) values (0.0, \"#{pocket_name}\",  #{accounts_id});", :symbolize_keys => true)

	end

	def delete_pockets

	end

	def create_goals(name, date, totalAmount )

		sesion=Login.new(@email, @password)
		id_user = sesion.log

		result = @db_connection.client.query("select accounts_id from users where id = #{id_user} ;", :symbolize_keys => true)
		accounts_id=999999

		result.each do |row|
			accounts_id=row[:accounts_id]
		end
		result = @db_connection.client.query("insert into goals (name, date, totalAmount, fulfilled, savedMoney, accounts_id ) values (\'#{name}\', \'#{date}\', #{totalAmount}, 0, 0, #{accounts_id});", :symbolize_keys => true)



	end

	def delete_goals

	end

end

=begin
test = Creation.new("yocc", "password3", "yocc@gmail.com")
test.register_user()
test.create_pocket("carro")
test.create_goals("viaje", "20210101", 3000, )
=end
