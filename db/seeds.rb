# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Admin.delete_all
Admin.create(name: 'Elias Hernandis', email: 'eliashernandis@gmail.com', password: 'helloworld', password_confirmation: 'helloworld').confirm

User.delete_all
User.create(name: 'Elias Hernandis', email: 'eliashernandis@gmail.com', password:'helloworld', password_confirmation: 'helloworld')


Cafeteria.delete_all
c = Cafeteria.create(name: 'Cafetería Politécnica', location: 'Escuela Politécnica Superior, callo Francisco Tomás y Valiente 11, 28049 Madrid', phone: '+34 914 97 22 26', hours: 'de lunes a viernes, de 8h a 20h', image_url: 'http://atvs.ii.uam.es/logo-eps.png')


Dish.delete_all
d1 = c.dishes.create(name: 'Buffet de ensaladas')
d2 = c.dishes.create(name: 'Pollo al limón')
c.dishes.create(name: 'Arroz a la cubana')
c.dishes.create(name: 'Escalope con patatas')

DishMenu.delete_all
Menu.delete_all
m = c.menus.create(served_at: 1.day.from_now, meal: 'comida')
m.dish_menus.create(dish: d1, course: 'primero')
m.dish_menus.create(dish: d2, course: 'segundo')

DishVote.delete_all
