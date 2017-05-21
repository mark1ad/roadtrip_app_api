# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###############
# Seed users
5.times do
  User.create({name: Faker::Name.name, password_digest: "password"})
end

# User.create({name: 'mark', password_digest: 'mark'})

#############
# Seed roadtrips and assign to user
5.times do
  Roadtrip.create({name: Faker::Lorem.sentence(3,false,0), description: Faker::Lorem.sentence})
end

UserRoadtrip.create([
  { user_id: 1, roadtrip_id: 1},
  { user_id: 1, roadtrip_id: 2},
  { user_id: 2, roadtrip_id: 3},
  { user_id: 2, roadtrip_id: 5},
  { user_id: 3, roadtrip_id: 4}
  ])

##################
# Seed cities and assign to roadtrip
5.times do
  City.create({ location: Faker::Address.city + ', ' + Faker::Address.state_abbr, startdate: Faker::Time.forward(30, :morning)})
end

City.find(1).update(roadtrip_id: 1, triporder: 1)
City.find(2).update(roadtrip_id: 1, triporder: 3)
City.find(3).update(roadtrip_id: 1, triporder: 2)
City.find(4).update(roadtrip_id: 2, triporder: 2)
City.find(5).update(roadtrip_id: 2, triporder: 1)

######################
# Seed attractions and assign to city
5.times do
  Attraction.create({ name: Faker::TwinPeaks.location, location: Faker::Address.street_address})
end

Attraction.find(1).update(city_id: 1)
Attraction.find(2).update(city_id: 1)
Attraction.find(3).update(city_id: 1)
Attraction.find(4).update(city_id: 2)
Attraction.find(5).update(city_id: 2)
