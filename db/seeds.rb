require 'faker'

# Create Users
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

umar = User.create!(
  name: 'Umar Khokhar',
  email: 'ujkhokhar@gmail.com',
  password: 'helloworld'
)

umar.skip_confirmation!
umar.save!

users = User.all
puts "#{User.count} users created"

# Create items
25.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end
items = Item.all
puts "#{Item.count} items created"

puts "Seed finished"