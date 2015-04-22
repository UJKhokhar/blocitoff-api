require 'faker'

## Create lists
10.times do
  List.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
lists = List.all
puts "#{List.count} lists created"

## Create items
25.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    list: lists.sample
  )
end

puts "25 items created"
puts "Seed finished"
