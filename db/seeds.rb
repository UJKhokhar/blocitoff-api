require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

# Special user
umar = User.new(
  name: 'Umar Khokhar',
  email: 'ujkhokhar@gmail.com',
  password: 'helloworld'
)
umar.skip_confirmation!
umar.save!

users = User.all
puts "6 users created"

# Create items
25.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end
puts "25 items created"

puts "Seed finished"
