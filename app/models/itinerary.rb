class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :itinerary_pois
  has_many :pois, through: :itinerary_pois
end
