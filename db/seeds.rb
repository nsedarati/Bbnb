20.times do
  home_type = ["Apartment", "House", "Bed & Breakfast"].sample
  room_type = ["Entire", "Private", "Shared"].sample
  accommodate = ["1", "2", "3", "4", "5", "6+"].sample
  bed_room = ["1", "2", "3", "4+"].sample
  bath_room = ["1", "2", "3", "4+"].sample
  listing_name = Faker::Pokemon.name
  summary = Faker::Lorem.sentence(3)
  is_internet = rand(2)
  is_smoker = rand(2)
  is_pet = rand(2)
  price = rand(10..100)
  active = rand(2)
  address = Faker::Pokemon.location


  Listing.create(home_type: home_type, room_type: room_type, accommodate: accommodate, bed_room: bed_room, bath_room: bath_room, listing_name: listing_name, summary: summary, address: address, is_internet: is_internet, is_smoker: is_smoker, is_pet: is_pet, price: price, active: active, user_id: rand(1..4))
end
