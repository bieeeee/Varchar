require 'faker'

20.times do
  Character.create!(
    name: Faker::Superhero.name,
    price: rand(20..50),
    description: Faker::Movie.quote,
    category: Faker::Superhero.prefix,
    address: Faker::Address.full_address,
    user_id: 1
  )
end

5.times do
  Booking.create!(
    start_date: Faker::Date.forward(days: 23),
    end_date: Faker::Date.backward(days: 14),
    status: ["Pending", "Completed", "Denied"].sample,
    user_id: 1,
    character_id: rand(1..20)
  )
end
