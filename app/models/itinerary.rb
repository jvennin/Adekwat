class Itinerary < ApplicationRecord
  belongs_to :user, optional: true
  has_many :itinerary_pois
  has_many :pois, through: :itinerary_pois
  belongs_to :origin, class_name: 'Location', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Location', foreign_key: 'destination_id'


  after_create :search_api_google
end
