#require_relative 'connection.rb'
#require_relative 'create.rb'
#require_relative "login.rb"
require_relative "menu.rb"

while true
    system("clear")
    puts "Bienvenido a Mock-Nequi", "Usted desea: ", "1. Regiatrarse" , "2. Iniciar Sesion" , "3. Salir del programa"
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
        puts "Registro del usuario"
        puts "Inicio de sesion"
        menu = Menu.new
        menu.main_menu()


    when "2"
        system("clear")
        puts "Ingrese su correo electronico:"
        email = gets.chomp
        puts "Ingrese contraseña: "
        password = gets.chomp
        puts "Validar que el usuario ya este registrado"
        menu = Menu.new
        menu.main_menu()

    when "3"
        system("clear")
        puts "Saliendo del programa..."
        break
    end

end
