# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
	email: "234@234",
	password: "123456"
	)

3.times do |n|
	EndUser.create!(
		email: "#{n + 1}23@123",
		password: "#{n + 1}23456",
		last_name: "test#{n + 1}",
		first_name: "test#{n + 1}",
		first_name_kana: "test#{n + 1}",
		last_name_kana: "test#{n + 1}",
		postal_code: "#{n + 1}234567",
		address: "東京都渋谷区#{n + 1}",
		phone_number: "#{n + 1}2345678901"
	)
end

3.times do |n|
	EndUser.all.each do |end_user|
		end_user.shippings.create!(
			end_user_id: "#{n + 1}",
			postal_code: "#{n + 1}510000",
			address: "東京都#{n + 1}",
			name: "test#{n + 1}"
			)
	end
end



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

3.times do |n|
	Item.create!(
		[
			{
			genre_id: "1",
			image: File.open('./app/assets/images/rails.png'),
			name: "test#{n + 1}",
			detail: "test#{n + 1}",
			price: "#{n + 1}000",
			is_sale: true
			},
			{
			genre_id: "2",
			image: File.open('./app/assets/images/rails.png'),
			name: "test#{n + 1}",
			detail: "test#{n + 1}",
			price: "#{n + 1}000",
			is_sale: true
			},
			{
			genre_id: "3",
			image: File.open('./app/assets/images/rails.png'),
			name: "test#{n + 1}",
			detail: "test#{n + 1}",
			price: "#{n + 1}000",
			is_sale: true
			}
		]
	)
end



