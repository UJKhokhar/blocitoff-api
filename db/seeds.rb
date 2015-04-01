require 'faker'

## Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    auth_token: SecureRandom.uuid.gsub(/\-/, '')
  )
  user.skip_confirmation!
  user.save!
end

# Special user
umar = User.new(
  name: 'Umar Khokhar',
  email: 'ujkhokhar@gmail.com',
  password: 'helloworld',
  auth_token: 'umartoken'
)
umar.skip_confirmation!
umar.save!

users = User.all
puts "6 users created"

## Create lists
10.times do
  List.create!(
    user: users.sample,
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
lists = List.all
puts "#{List.count} lists created"

## Create items
25.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence,
    list: lists.sample
  )
end
puts "25 items created"

puts "Seed finished"
