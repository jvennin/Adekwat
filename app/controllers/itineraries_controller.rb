class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :show]

  def create
    @profile = Profile.new(walking_duration: params[:walking_duration], stairs: params[:stairs], connection: params[:connection], escalator: params[:escalator])
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
    authorize @itinerary
    @result = JSON.parse(@itinerary.payload)
  end

  def index
    @results = policy_scope(Itinerary)
    #raise
  end
end
