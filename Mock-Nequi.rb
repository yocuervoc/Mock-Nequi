require_relative 'connection.rb'
require_relative 'create.rb'
require_relative "login.rb"
require_relative "menu.rb"

while true
    system("clear")
    puts "----------------------------------------------",
         "-----------------Mock-Nequi-------------------",
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
        usuario = User.new(email,email,password)
        Menu = Menu.new(usuario)
        Menu.main_menu(usuario)

    when "3"
        system("clear")
        puts "Saliendo del programa..."
        break
    end

end
