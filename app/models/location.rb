class Location < ApplicationRecord
  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode, if: :will_save_change_to_address?
end
