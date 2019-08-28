class RemoveCoordinatesFromItineraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :itineraries, :start_address
    remove_column :itineraries, :end_address
    remove_column :itineraries, :start_lat
    remove_column :itineraries, :start_lng
    remove_column :itineraries, :end_lat
    remove_column :itineraries, :end_lng
  end
end
