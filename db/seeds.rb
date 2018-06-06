# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# p "Creating Users"
#
# 10.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: "Password!2"
#   )
# end
#
# p "#{User.all.count} users created"
#
# free = [true, false, false, false]
#
# 30.times do
#   item = Item.new(
#     title: Faker::App.name,
#     description: Faker::Lorem.paragraph(3),
#     location: Faker::Address.city,
#     available_from: (Date.today + rand(10...35)),
#     available_to: (Date.today + rand(30...60)),
#     price: rand(20..30),
#     free: free.sample,
#     user: User.find(rand(1..9))
#   )
#  if item.free
#    item.price = nil
#  end
#
#    item.save
# p "#{item.title} created"
# end

20.times do
  Favourite.create(user: User.all.sample, item: Item.all.sample)
end
