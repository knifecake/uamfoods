# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Admin.delete_all
Admin.create(email: 'eliashernandis@gmail.com', password: 'helloworld', password_confirmation: 'helloworld').confirm
