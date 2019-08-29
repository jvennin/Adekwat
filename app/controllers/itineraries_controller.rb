class ItinerariesController < ApplicationController
  def index
    @results = policy_scope(Itinerary)
    start_location = Location.create(address: params[:search][:start_location])
    end_location = Location.create(address: params[:search][:end_location])
    # itinerary = Itinerary.new(origin: start_location, destination: end_location)
    itinerary = Itinerary.new
    itinerary.origin = start_location
    itinerary.destination = end_location
    itinerary.save!

    # search_api_google(itinerary.origin.lat)

    @locations = Location.geocoded #returns Itinerary with coordinates

    @markers = @locations.map do |location|
      {
        lat: location.lat,
        lng: location.lng,
        infoWindow: render_to_string(partial: "info_window", locals: { location: location }),
        image_url: helpers.asset_url('https://t2.ftcdn.net/jpg/00/37/61/51/400_F_37615199_AYU8aTt35BvMUXmy9zpUMptTIjYvax1a.jpg')
      }
    end
    #raise
  end

  private

  def search_api_google
    # require 'json'
    # require 'open-uri'

    # url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{itinerary.origin.lat, itinerary.origin.lng}&destination=#{itinerary.destination.lat, itinerat}&mode=transit&key=#{API_KEY_GOOGLE}"
    # itinerary_results = open(url).read
    # itinerary = JSON.parse(itinerary_results)
    puts "ca marche !"
    raise
    #puts "#{itinerary['routes']}"
  end
end
