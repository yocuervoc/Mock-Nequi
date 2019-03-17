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
      sleep(3)
    when "2"
      system("clear")
      puts "¿Cuanto dinero desea retirar?"
      value = gets.chomp.to_i
      modificador.withdraw_money(value)
      puts "nuevo saldo #{consulta.available_balance_query}"
      sleep(3)

    when "3"
      system("clear")
      puts "Ingrese el correo del usuario destino"
      email = gets.chomp
      puts "Ingrese valor a depositar"
      value = gets.chomp.to_i
      modificador.send_money(email,value)
      puts "nuevo saldo #{consulta.available_balance_query}"
      sleep(3)

    when "4"
      modificador.transactions_query

    when "5"

    when "8"
      break
    end

  end
end
end
