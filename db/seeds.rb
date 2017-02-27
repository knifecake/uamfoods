# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Admin.delete_all
if ENV['UF_ADMIN']
  puts "New admin with string: " + ENV['UF_ADMIN']
  name, email, password = ENV['UF_ADMIN'].split(':')
  a = Admin.new(name: name, email: email, password: password, password_confirmation: password)
  a.skip_confirmation!
  a.save
end

User.delete_all
User.create(name: 'Elias Hernandis', email: 'eliashernandis@gmail.com', password:'helloworld', password_confirmation: 'helloworld')


Cafeteria.delete_all
c = Cafeteria.create(name: 'Cafetería Politécnica', location: 'Escuela Politécnica Superior, callo Francisco Tomás y Valiente 11, 28049 Madrid', phone: '+34 914 97 22 26', hours: 'de lunes a viernes, de 8h a 20h', image_url: 'http://atvs.ii.uam.es/logo-eps.png')


Dish.delete_all
c.dishes.create(name: 'Buffet de ensaladas')
c.dishes.create(name: 'Arroz a la cubana con salchichas')
c.dishes.create(name: 'Ensalada francesa')
c.dishes.create(name: 'Crema de zanahorias')
c.dishes.create(name: 'Croquetas y empanadillas')
c.dishes.create(name: 'Lomo asado a la naranja')
c.dishes.create(name: 'Merluza andaluza con patatas panaderas')
c.dishes.create(name: 'Macarrones boloñesa')
c.dishes.create(name: 'Judías verdes rehogadas')
c.dishes.create(name: 'Salmorejo cordobés')
c.dishes.create(name: 'Huevos fritos con morcilla y bacon')
c.dishes.create(name: 'Pollo asado al limón')
c.dishes.create(name: 'Pescado plancha')
c.dishes.create(name: 'Lentejas estofadas')
c.dishes.create(name: 'Espaguetis al ajillo')
c.dishes.create(name: 'Acelgas extremeñas')
c.dishes.create(name: 'Tosta de serrano con huevo')
c.dishes.create(name: 'Soldaditos de pavia')
c.dishes.create(name: 'Albóndigas riojana')
c.dishes.create(name: 'Paella mixta')
c.dishes.create(name: 'Patatas guisadas')
c.dishes.create(name: 'Ensalada de pasta')
c.dishes.create(name: 'Lasaña al horno')
c.dishes.create(name: 'Bacaladitos')
c.dishes.create(name: 'Tortilla española paisana')
c.dishes.create(name: 'Olla de garbanzos')
c.dishes.create(name: 'Tallarines italiana')
c.dishes.create(name: 'Verduras al horno')
c.dishes.create(name: 'Escalope de pollo')
c.dishes.create(name: 'Revuelto de la casa')
c.dishes.create(name: 'Varitas de merluza con salsa ali-oli')

DishMenu.delete_all
Menu.delete_all
DishVote.delete_all
