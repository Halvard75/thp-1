# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  Flight.create(flight_code: "N°#{n}", duration: "#{n}", datetime: "", departure_airport: "", arrival_airport: "", destination_id: "", origin_id: "")
end

Airport.create(airport_code: "CDG")
Airport.create(airport_code: "LUX")
Airport.create(airport_code: "UKL")
Airport.create(airport_code: "JFK")
Airport.create(airport_code: "AMS")
Airport.create(airport_code: "BXM")
Airport.create(airport_code: "SPB")
Airport.create(airport_code: "MLI")
Airport.create(airport_code: "STU")
Airport.create(airport_code: "ORL")

