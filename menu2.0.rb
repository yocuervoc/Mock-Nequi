require_relative 'connection.rb'
require_relative 'create.rb'
require_relative 'login.rb'
require_relative 'query.rb'
require_relative 'modifier.rb'

class Menu2


usuario = User.new("david", "david@gmial.com", "12345")
creacion = Creation.new(usuario)
creacion.register_user
consulta = Query.new(usuario)
modificador = Modifier.new(usuario)




end
