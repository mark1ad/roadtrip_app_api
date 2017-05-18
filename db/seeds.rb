# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  User.create({name: Faker::Name.name})
end

5.times do
  Roadtrip.create({name: Faker::Lorem.sentence(3,false,0)})
end

UserRoadtrip.create([
  { user_id: 1, roadtrip_id: 1},
  { user_id: 1, roadtrip_id: 2},
  { user_id: 2, roadtrip_id: 2},
  { user_id: 2, roadtrip_id: 3},
  { user_id: 2, roadtrip_id: 5}
  ])

10.times do
  City.create({ location: Faker::Address.city + ', ' + Faker::Address.state_abbr, startdate: Faker::Time.forward(30, :morning)})
end

City.find(1).update(roadtrip_id: 1, triporder: 1)
City.find(3).update(roadtrip_id: 1, triporder: 2)
