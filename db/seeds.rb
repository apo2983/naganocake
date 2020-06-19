# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
	email: "234@234",
	password: "Goldbird22"
	)

Genre.create!(
	[
		{
		name: 'test1',
		is_valid: true
		},
		{
		name: 'test2',
		is_valid: true
		},
		{
		name: 'test3',
		is_valid: true	
		}
	]
)

Genre.all.each do |genre|
	genre.items.create!(
	[
		{
		image: File.open('./app/assets/images/rails.png'),
		name: 'test1',
		detail: 'test1',
		price: '1000',
		is_sale: true
		},
		{
		image: File.open('./app/assets/images/rails.png'),
		name: 'test2',
		detail: 'test2',
		price: '2000',
		is_sale: true
		},
		{
		image: File.open('./app/assets/images/rails.png'),
		name: 'test3',
		detail: 'test3',
		price: '3000',
		is_sale: true	
		}
	]
)
end



