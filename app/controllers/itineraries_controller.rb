class ItinerariesController < ApplicationController
  def index
    @results = policy_scope(Itinerary)
  end
end
