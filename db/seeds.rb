# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "# Module Users"
5.times do
  email = Faker::Internet.email
  puts "## Creating #{email}"
  User.create(email: email, password: "123456") if User.count.zero?
end

puts "# Module Admins"
1.times do
  email = "admin@fidelity-plan.com"
  puts "## Creating #{email}"
  Admin.create(email: email, password: "123456") if Admin.count.zero?
end

puts "# Module Food"
Food.destroy_all

10.times do
  Food.create(name: Faker::Food.unique.dish,
              description: Faker::Food.description,
              price: Faker::Number.decimal(l_digits: 2, r_digits: 3))
end

puts "# Module Drink"
Drink.destroy_all

5.times do
  Drink.create(name: "suco de abacaxi",
               price: Faker::Number.decimal(l_digits: 2, r_digits: 3))
end