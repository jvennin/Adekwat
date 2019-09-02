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
    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{start_location.lat}, #{start_location.lng}&destination=#{end_location.lat}, #{end_location.lng}&mode=transit&key=#{ENV["API_KEY_GOOGLE"]}"
    itinerary_results = open(url).read
    #itinerary.payload = JSON.parse(itinerary_results)
    self.payload = itinerary_results
    self.save
  end

  def legs
    JSON.parse(payload)["routes"].first["legs"].map do |payload_leg|
      Leg.new(payload_leg)
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
    results = []
    response["routes"].first["legs"].first['steps'].each do |step|
      # results << [step['start_location']['lat'], step['start_location']['lng']]
      # results << [step['end_location']['lat'], step['end_location']['lng']]

      start_location = {
        lat: step['start_location']['lat'],
        lng: step['start_location']['lng'],
        # image_url: helpers.asset_url('https://t2.ftcdn.net/jpg/00/37/61/51/400_F_37615199_AYU8aTt35BvMUXmy9zpUMptTIjYvax1a.jpg')
      }
      results << start_location
      end_location = {
        lat: step['end_location']['lat'],
        lng: step['end_location']['lng'],
        # image_url: helpers.asset_url('https://t2.ftcdn.net/jpg/00/37/61/51/400_F_37615199_AYU8aTt35BvMUXmy9zpUMptTIjYvax1a.jpg')
      }
      results << end_location
    end
    results
  end

  def lines
    response = JSON.parse(payload)
    results = []
    response["routes"].first["legs"].first['steps'].each do |step|
      results << [step['start_location']['lng'], step['start_location']['lat']]
      results << [step['end_location']['lng'], step['end_location']['lat']]
    end
    results
  end

  # def steps
  #   JSON.parse(payload)["routes"].first["legs"].first["steps"].map do |payload_step|
  #     Step.new(payload_step)
  #   end
  # end
end
