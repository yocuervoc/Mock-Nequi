require_relative 'connection.rb'
require_relative 'create.rb'
require_relative 'login.rb'
require_relative 'query.rb'
require_relative 'modifier.rb'

module Menu2

  def main_menu(user)
  creacion = Creation.new(user)
  consulta = Query.new(user)
  modificador = Modifier.new(user)
  while true
    system("clear")
    #Atualizar valor de la cuenta principal
    puts "----------------------------------------------",
       "-----------------Mock-Nequi-------------------",
       "",
       "Bienvenido  #{user.name}",
       "",
       "Total de dinero: #{consulta.available_balance_query}",
       "Saldo disponible en la cuenta: #{consulta.total_balance_query}",
       "En colchon: #{consulta.mattress_money_query}",
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
      modificador.add_money_account(value)
      puts "nuevo saldo #{consulta.available_balance_query}"
      sleep(2)
    when "2"
      system("clear")
      puts "¿Cuanto dinero desea retirar?"
      value = gets.chomp.to_i
      modificador.withdraw_money(value)
      puts "nuevo saldo #{consulta.available_balance_query}"
      sleep(2)

    when "3"
      system("clear")
      puts "Ingrese el correo del usuario destino"
      email = gets.chomp
      puts "Ingrese valor a depositar"
      value = gets.chomp.to_i
      modificador.send_money(email,value)
      puts "nuevo saldo #{consulta.available_balance_query}"
      sleep(2)

    when "4"
      modificador.transactions_query

    when "5"

    when "6"
      pocket_menu(user, creacion, consulta, modificador)
    when "7"
      goals_menu(user, creacion, consulta, modificador)
    when "8"
      break
    end

  end
end

  def pocket_menu(user,creacion, consulta, modificador)
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
     "5. Volver"
     option = gets.chomp
    case option
    when "1"
    puts "Nombre del bolsillo"
    pocket_name = gets.chomp
    creacion.create_pocket(pocket_name)
    puts "bolsillo creado exitosamente"
    sleep(2)
    when "2"
    puts "Ingrese el numero del bolsillo que desea eliminar"
    number = gets.chomp.to_i
    creacion.delete_pocket(name_pocket)
    puts "bolsillo creado exitosamente"
    sleep(2)
    when "3"
    puts "Ingrese el nombre del bolsillo al que desea agregarle dinero"
    nombre_pocket = gets.chomp
    puts "Ingrese la cantidad de dinero"
    amount = gets.chomp.to_i
    modificador.add_money_pocket(nombre_pocket, amount)
    sleep(2)
    when "4"
    puts "Ingrese el nombre del bolsillo que desea retirarle dinero"
    nombre_pocket = gets.chomp
    puts "Ingrese la cantidad de dinero"
    amount = gets.chomp.to_i
    modificador.withdraw_money_pocket(nombre_pocket, amount)
    sleep(2)

    when "5"
      puts ""
    end
  end


  def goals_menu(user,creacion, consulta, modificador)
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
        creacion.create_goals(goal_name, goal_date, value)
				#Validar que los datos sean correctos
				#Realizar el deposito
			when "2"
				puts "Ingrese el nombre de la meta que desea cerrar"
				toclose = gets.chomp
        crecion.delete_goals(toclose)
			when "3"
				puts "Ingrese nombre de la meta"
				nombre = gets.chomp
				puts "Ingrese valor a depositar"
				value = gets.chomp.to_i
        modificador.add_money_goal(value, nombre)
				#Validar que hay suficiente dinero
				#Realizar el deposito
			when "4"
				break
			end
		end
	end
end
