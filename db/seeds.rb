# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Admin.delete_all
Admin.create(name: 'Elias Hernandis', email: 'eliashernandis@gmail.com', password: 'helloworld', password_confirmation: 'helloworld').confirm


Cafeteria.delete_all
c = Cafeteria.create(name: 'Cafetería Politécnica', location: 'Escuela Politécnica Superior, callo Francisco Tomás y Valiente 11, 28049 Madrid', phone: '+34 914 97 22 26', hours: 'de lunes a viernes, de 8h a 20h')

Menu.delete_all

Dish.delete_all
c.dishes.create(name: 'Pollo al limón')
c.dishes.create(name: 'Arroz a la cubana')
c.dishes.create(name: 'Escalope con patatas')
c.dishes.create(name: 'Buffet de ensaladas')

DishMenu.delete_all
