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

  def duration
    # sum = 0
    # legs.each do |leg|
    #   sum += leg.duration.to_i
    # end
    # sum

    legs.inject(0) do |sum, leg|
      sum + leg.duration.to_i
    end
  end

  def markers
    response = JSON.parse(payload)
    routes = []
    response["routes"].each do |route|
      route_results = []
        route["legs"].first['steps'].each do |step|
        # results << [step['start_location']['lat'], step['start_location']['lng']]
        # results << [step['end_location']['lat'], step['end_location']['lng']]

        start_location = {
          lat: step['start_location']['lat'],
          lng: step['start_location']['lng'],
          # image_url: helpers.asset_url('https://t2.ftcdn.net/jpg/00/37/61/51/400_F_37615199_AYU8aTt35BvMUXmy9zpUMptTIjYvax1a.jpg')
        }
        route_results << start_location
        end_location = {
          lat: step['end_location']['lat'],
          lng: step['end_location']['lng'],
          # image_url: helpers.asset_url('https://t2.ftcdn.net/jpg/00/37/61/51/400_F_37615199_AYU8aTt35BvMUXmy9zpUMptTIjYvax1a.jpg')
        }
        route_results << end_location
      end
      routes << route_results
    end
    routes
  end

  def lines
    response = JSON.parse(payload)
    lines_results = []
    response["routes"].each do |route|
      results = []
      route["legs"].first['steps'].each do |step|
        results << [step['start_location']['lng'], step['start_location']['lat']]
        results << [step['end_location']['lng'], step['end_location']['lat']]
      end
      lines_results << results
    end
    lines_results
  end

  def colors
    ['red', 'green', 'blue', 'orange']
  end
end
