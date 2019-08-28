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
    #raise
  end
end
