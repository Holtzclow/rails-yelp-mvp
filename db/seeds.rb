puts "cleaning up database"
Restaurant.destroy_all
puts "database is clean"
puts "creating restaurant"
100.times do
  restaurant = Restaurant.create!( 
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  10.times do
  review = Review.create!(
    restaurant: restaurant,
    content: Faker::Restaurant.review,
    rating: rand(1..5)
  )
  end
end