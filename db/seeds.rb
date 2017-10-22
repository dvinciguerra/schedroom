# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# add default users
User.create([
	{first_name: 'Daniel', last_name: 'Vinciguerra', email: 'test@test.com', password: 'test'},
	{first_name: 'Rodolfo', last_name: 'Spalenza', email: 'rodolfo.spalenza@test.com', password: 'test'},
	{first_name: 'Ícaro', last_name: 'Torres', email: 'icaro.torres@test.com', password: 'test'}
])


Room.create([
	{name: 'Bat Caverna', description: 'Caverna secreta na mansão Wayne', location: 'Localização exata desconhecida. Fica dentro da propriedade de Bruce Wayne'}
])
