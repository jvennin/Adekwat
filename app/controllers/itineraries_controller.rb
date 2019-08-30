class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :show]
  def create
    # instancier une nouvelle instance d'itineraire
    # sauvegarder (automantiquement appeler l'api sur cette instance 'after_create')
    # redirect to show de cette instance d'itineraire
    start_location = Location.create(address: params[:search][:start_location])
    end_location = Location.create(address: params[:search][:end_location])
    # itinerary = Itinerary.new(origin: start_location, destination: end_location)
    @itinerary = Itinerary.new
    @itinerary.origin = start_location
    @itinerary.destination = end_location
    @itinerary.save!
    authorize @itinerary
    @itinerary.search_api_google

    redirect_to itinerary_path(@itinerary)
  end

  def show

    @itinerary = Itinerary.find(params[:id])
    # afficher les infos de l'itinéraire et du payload
    @locations = Location.geocoded #returns Itinerary with coordinates
    # search_api_google(itinerary.origin.lat)
    #@itineraries = Itinerary.all
    authorize @itinerary
    @result = JSON.parse(@itinerary.payload)
    #@possibilities = @result["routes"]

    #raise







    @markers = @locations.map do |location|
      {
        lat: location.lat,
        lng: location.lng,
        infoWindow: render_to_string(partial: "info_window", locals: { location: location }),
        image_url: helpers.asset_url('https://t2.ftcdn.net/jpg/00/37/61/51/400_F_37615199_AYU8aTt35BvMUXmy9zpUMptTIjYvax1a.jpg')
      }
    end
  end

  def index
    @results = policy_scope(Itinerary)
    #raise
  end
end
