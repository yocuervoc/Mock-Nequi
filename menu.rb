require_relative 'connection.rb'
require_relative 'create.rb'
require_relative 'user.rb'
require_relative 'login.rb'
require_relative 'query.rb'
require_relative 'modifier.rb'

class Menu

	def initialize
		#@db_connection = DbConnection.new()
		#id del usuario
		#nombre del usuario
		#cuenta principal
		#bolsillos
		#metas
		
	end
	
	def main_menu
		while true
			system("clear")
			#Atualizar valor de la cuenta principal
			puts "----------------------------------------------",
				 "-----------------Mock-Nequi-------------------",
				 "",
				 "Bienvenido #nombre del usuario",
				 "",
				 "Total de dinero: #total",
				 "Saldo cuenta principal: #cuenta principal",
				 "En colchon: #Saldo en el colchon",
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
				puts "¿Cuanto dinero desea agregar?"
				value = gets.chomp.to_i
				#Deposita en la cuenta

			when "2"
				puts "¿Cuanto dinero desea retirar?"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero
				puts "Saldo actual:  #saldo cuenta principal"
			
			when "3"
				puts "Ingrese el correo del usuario destino"
				email = gets.chomp
				puts "Ingrese valor a depositar"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero y que el usuario destino exista
				#Realizar el deposito
			
			when "4"
				#Visualizacion de los ultimos 10 movimientos
			
			when "5"
				mattress_menu()
			
			when "6"
				pockets_menu()
			
			when "7"
				goals_menu()
			
			when "8"
				break
			end
			
		end
		
	end
	
	def mattress_menu
		while true
			system("clear")
			#Atualizar valor del colchon
			puts "----------------------------------------------",
				 "-----------------Mock-Nequi-------------------",
				 "",
				 "Guardado en colchon: #Saldo en el colchon",
				 "",
				 "¿Que deseas hacer?",
				 "1. Agregar dinero disponible al colchon",
				 "2. Enviar dinero a la cuenta principal",
				 "3. Volver"
			
			option = gets.chomp
			case option
			when "1"
				puts "¿Cuanto dinero desea ingresar al colchon?"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero
				#Realizar la operacion
			when "2"
				puts "¿Cuanto desea sacar del colchon?"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero
				#Realizar la operacion
			when "3"
				break
			end
		end
	end
	
	def pockets_menu
		while true
			system("clear")
			#Atualizar Lista de Bolsillos
			puts "----------------------------------------------",
				 "-----------------Mock-Nequi-------------------",
				 "",
				 "Bolsillos Actuales:",
				 "#Lista de Bolsillos",
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
				puts "Nombre del bolsillo"
				pocket_name = gets.chomp
				#Creacion del bolsillo
				#Agregar a la lista
			when "2"
				puts "Ingrese el numero del bolsillo que desea eliminar"
				number = gets.chomp.to_i
				#Eliminar el bolsillo
			when "3"
				puts "Ingrese el numero del bolsillo que desea agregarle dinero"
				number = gets.chomp.to_i
				puts "Ingrese la cantidad de dinero"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero
				#Realizar la operacion
			when "4"
				puts "Ingrese el numero del bolsillo que desea retirarle dinero"
				number = gets.chomp.to_i
				puts "Ingrese la cantidad de dinero"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero
				#Realizar la operacion
			when "5"
				puts "Ingrese el numero del bolsillo del que desea enviar dinero"
				number = gets.chomp.to_i
				puts "Ingrese el correo del usuario destino"
				email = gets.chomp
				puts "Ingrese valor a depositar"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero y que el usuario destino exista
				#Realizar el deposito
			when "6"
				break
			end
		end
	end

	def goals_menu
		while true
			system("clear")
			#Atualizar Lista de Metas
			puts "----------------------------------------------",
				 "-----------------Mock-Nequi-------------------",
				 "",
				 "Metas Actuales:",
				 "#Lista de Metas",
				 "",
				 "¿Que deseas hacer?",
				 "1. Crear meta",
				 "2. Cerrar meta",
				 "3. Agregar dinero a una meta",
				 "4. Volver"

			option = gets.chomp
			case option
			when "1"
				puts "Ingrese el nombre de la meta"
				goal_name = gets.chomp
				puts "Ingrese el valor de la meta"
				value = gets.chomp.to_i
				puts "Ingrese Fecha limite (YYYY-MM-DD)"
				goal_date = gets.chomp
				#Validar que los datos sean correctos
				#Realizar el deposito
			when "2"
				puts "Ingrese el numero de la meta que desea cerrar"
				#Lista de metas
				toclose = gets.chomp.to_i
				#Cerrar meta
			when "3"
				puts "Ingrese el numero de la meta"
				number = gets.chomp.to_i
				puts "Ingrese valor a depositar"
				value = gets.chomp.to_i
				#Validar que hay suficiente dinero
				#Realizar el deposito
			when "4"
				break
			end
		end
	end

end