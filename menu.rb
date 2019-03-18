require_relative 'connection.rb'
require_relative 'create.rb'
require_relative 'login.rb'
require_relative 'query.rb'
require_relative 'modifier.rb'
require_relative 'user.rb'

class Menu

	def initialize(user)
		@user_name = user.name
		@creacion = Creation.new(user)
		@consulta = Query.new(user)
		@modificador = Modifier.new(user)

	end

	def main_menu(user)
		while true
			system("clear")
		  	puts"----------------------------------------------",
			    "-----------------Mock-Nequi-------------------",
		  		"",
				"Bienvenido  #{@user_name}",
				"",
				"Total de dinero: #{@consulta.available_balance_query}",
				"Saldo disponible en la cuenta: #{@consulta.total_balance_query}",
				"En colchon: #{@consulta.mattress_money_query}",
				"",
				"¿Que deseas hacer?",
				"1. Agregar dinero a la cuenta principal",
				"2. Retirar dinero de la cuenta principal",
				"3. Enviar dinero por email a otro usuario",
				"4. Ver transacciones",
				"5. Colchon",
				"6. Bolsillos",
				"7. Metas",
				"8. Cerrar sesion"
	
			option = gets.chomp
			case option
			when "1"
				system("clear")
				puts "¿Cuanto dinero desea agregar?"
				value = gets.chomp.to_i
				@modificador.add_money_account(value)
				puts "nuevo saldo #{@consulta.available_balance_query}"
				sleep(2)
			when "2"
				system("clear")
				puts "¿Cuanto dinero desea retirar?"
				value = gets.chomp.to_i
				@modificador.withdraw_money(value)
				puts "nuevo saldo #{@consulta.available_balance_query}"
				sleep(2)
		
			when "3"
				system("clear")
				puts "Ingrese el correo del usuario destino"
				email = gets.chomp
				puts "Ingrese valor a depositar"
				value = gets.chomp.to_i
				@modificador.send_money(email,value)
				puts "nuevo saldo #{@consulta.available_balance_query}"
				sleep(2)
		
			when "4"
				system("clear")
				puts "Listado de Tansacciones"
				puts @consulta.transactions_query
				sleep(5)
		
			when "5"
				mattress_menu()

			when "6"
				pockets_menu()

			when "7"
				goals_menu()

			when "8"
				break
			else
				system("clear")
				puts "Opcion incorrecta, vuelva a intentar"
				sleep(1)
			end
		end
	end
	
	def mattress_menu
		while true
			system("clear")
			puts"----------------------------------------------",
				"-----------------Mock-Nequi-------------------",
				"",
				"Guardado en colchon: #{@consulta.mattress_money_query}",
				"",
				"¿Que deseas hacer?",
				"1. Agregar dinero disponible al colchon",
				"2. Enviar dinero a la cuenta principal",
				"3. Volver"

			option = gets.chomp
			case option
			when "1"
				system("clear")
				puts "¿Cuanto dinero desea ingresar al colchon?"
				value = gets.chomp.to_i
				@modificador.add_money_mattress(value)
				puts "Nuevo saldo en el colchon: #{@consulta.mattress_money_query}"
				sleep(2)
			when "2"
				system("clear")
				puts "¿Cuanto desea sacar del colchon?"
				value = gets.chomp.to_i
				@modificador.withdraw_money_mattress(value)
				puts "Nuevo saldo en el colchon: #{@consulta.mattress_money_query}"
				sleep(2)
			when "3"
				break
			else
				system("clear")
				puts "Opcion incorrecta, vuelva a intentar"
				sleep(1)
			end
		end
	end

	def pockets_menu
		while true
			system("clear")
			puts"----------------------------------------------",
				"-----------------Mock-Nequi-------------------",
				"",
				"Bolsillos Actuales:",
				"#{@consulta.pockets_list}",
				"",
				"¿Que deseas hacer?",
				"1. Crear bolsillo",
				"2. Eliminar bolsillo",
				"3. Agregar dinero a un bolsillo",
				"4. Retirar dinero de un bolsillo",
				"5. Enviar dinero de un bolsillo a otro usuario",
				"6. Volver"

			option = gets.chomp
			case option
			when "1"
				system("clear")
				puts "Nombre del bolsillo"
				pocket_name = gets.chomp
				@creacion.create_pocket(pocket_name)
				puts "Bolsillo creado exitosamente"
				sleep(2)
				
			when "2"
				system("clear")
				puts "Ingrese el nombre del bolsillo que desea eliminar"
				pocket_name = gets.chomp
				@creacion.delete_pocket(pocket_name)
				puts "Bolsillo eliminado exitosamente"
				sleep(2)
				
			when "3"
				system("clear")
				puts "Ingrese el nombre del bolsillo que desea agregarle dinero"
				pocket_name = gets.chomp
				puts "Ingrese la cantidad de dinero"
				value = gets.chomp.to_i
				@modificador.add_money_pocket(pocket_name,value)
				sleep(2)
				
			when "4"
				system("clear")
				puts "Ingrese el nombre del bolsillo que desea retirarle dinero"
				pocket_name = gets.chomp
				puts "Ingrese la cantidad de dinero"
				value = gets.chomp.to_i
				@modificador.withdraw_money_pocket(pocket_name,value)
				sleep(2)
			when "5"
				system("clear")
				puts "Ingrese el nombre del bolsillo del que desea enviar dinero"
				pocket_name = gets.chomp
				puts "Ingrese el correo del usuario destino"
				email = gets.chomp
				puts "Ingrese valor a depositar"
				value = gets.chomp.to_i
				#A otro usuario
				@modificador.send_money_pocket(pocket_name,value)
				sleep(2)
			when "6"
				break
			else
				system("clear")
				puts "Opcion incorrecta, vuelva a intentar"
				sleep(1)
			end
		end
	end

	def goals_menu
		while true
			system("clear")
			puts"----------------------------------------------",
				"-----------------Mock-Nequi-------------------",
				"",
				"Metas Actuales:",
				"#{@consulta.goals_list}",
				"",
				"¿Que deseas hacer?",
				"1. Crear meta",
				"2. Cerrar meta",
				"3. Agregar dinero a una meta",
				"4. Volver"

			option = gets.chomp
			case option
			when "1"
				system("clear")
				puts "Ingrese el nombre de la meta"
				goal_name = gets.chomp
				puts "Ingrese el valor de la meta"
				value = gets.chomp.to_i
				puts "Ingrese Fecha limite (YYYYMMDD)"
				goal_date = gets.chomp
				@creacion.create_goals(goal_name,goal_date,value)
				sleep(2)
			when "2"
				system("clear")
				puts "Ingrese el numero de la meta que desea cerrar"
				toclose = gets.chomp
				@creacion.delete_goals(toclose)
			when "3"
				system("clear")
				puts "Ingrese el nombre de la meta"
				goal_name = gets.chomp
				puts "Ingrese valor a depositar"
				value = gets.chomp.to_i
				@modificador.add_money_goal(goal_name,value)
				sleep(2)
			when "4"
				break
			else
				system("clear")
				puts "Opcion incorrecta, vuelva a intentar"
				sleep(1)
			end
		end
	end
end
