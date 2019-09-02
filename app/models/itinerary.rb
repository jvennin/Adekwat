require 'json'
require 'open-uri'

class Itinerary < ApplicationRecord
  belongs_to :user, optional: true
  has_many :itinerary_pois
  has_many :pois, through: :itinerary_pois
  belongs_to :origin, class_name: 'Location', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Location', foreign_key: 'destination_id'

  after_create :search_api_google

  def search_api_google
    end_location = self.destination
    start_location = self.origin
    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{start_location.lat}, #{start_location.lng}&destination=#{end_location.lat}, #{end_location.lng}&mode=transit&&transit_mode=rail&alternatives=true&languages=fr&units=metric&region=fr&key=#{ENV["API_KEY_GOOGLE"]}"
    itinerary_results = open(url).read
    #itinerary.payload = JSON.parse(itinerary_results)
    self.payload = itinerary_results
    self.save
  end

  def routes
    JSON.parse(payload)["routes"].map do |payload_route|
      Route.new(payload_route)
    end
  end
end
