require_relative 'connection.rb'
require_relative 'create.rb'
require_relative "login.rb"
require_relative "menu.rb"

while true
    system("clear")
    puts "---------------------------------Mock-Nequi------------------------------------",
         "Usted desea: ",
         "1. Regiatrarse" ,
         "2. Iniciar Sesion" ,
         "3. Salir del programa"
    option = gets.chomp

    case option
    when "1"
        system("clear")
        puts "Ingrese su nombre:"
        user_name = gets.chomp
        puts "Ingrese su correo electronico:"
        email = gets.chomp
        puts "Ingrese contraseña: "
        password = gets.chomp
        usuario = User.new(user_name,email,password)
        creacion = Creation.new(usuario)
        creacion.register_user
        Menu = Menu.new(usuario)
        Menu.main_menu(usuario)

    when "2"
        system("clear")
        puts "Ingrese su correo electronico:"
        email = gets.chomp
        puts "Ingrese contraseña: "
        password = gets.chomp
        user = User.new(email,email,password)
        usuario = Login.new(user)
        if usuario.log.class == Integer 
            Menu = Menu.new(user)
            Menu.main_menu(user)
        else
            puts "Correo o contraseña incorrecta","Pulse enter para volver"
			option = gets.chomp
        end

    when "3"
        system("clear")
        puts "Saliendo del programa..."
        break
    else
        puts "Opcion incorrecta, vuelva a intentar","Pulse enter para volver"
		option = gets.chomp
    end
end
