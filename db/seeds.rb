# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

itinerary_google = open("https://maps.googleapis.com/maps/api/directions/json?origin=m%C3%A9tro%20parmentier&destination=La%20d%C3%A9fense&mode=transit&key=#{ENV['API_KEY_GOOGLE']}").read
google_parse = JSON.parse(itinerary_google)
list = google_parse["routes"].first

puts 'Cleaning database...'

ItineraryPoi.destroy_all
Itinerary.destroy_all
Profile.destroy_all
User.destroy_all
Poi.destroy_all


puts 'Creating User...'
new_user = User.new(email: "camille@lewagon.com", password: "123456")
new_user.save!
puts 'Creating Profile...'
new_profile = Profile.new(user_id: new_user.id, lift: true, escalator: true, walking_duration: 5, stairs: 0, score: 100, status: "Baby Hero")
new_profile.save!

puts 'Creating POI...'
new_poi = Poi.new(lat: 48.8658461, lng: 2.3721732, address: "75011 Paris", station_name: "Parmentier", lift: false, escalator: false, stairs_number: 88 )
new_poi.save!

puts 'Creating Itinerary...'
new_itinerary = Itinerary.new(user_id: new_user.id, payload: list.to_json)
new_itinerary.save!

puts 'Creating Itinerary_poi...'
new_itinerary_poi = ItineraryPoi.new(itinerary_id: new_itinerary.id, poi_id: new_poi.id)
new_itinerary_poi.save!


puts 'Finished!'
