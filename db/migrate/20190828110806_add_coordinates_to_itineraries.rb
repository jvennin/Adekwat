class AddCoordinatesToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :start_lat, :float
    add_column :itineraries, :start_lng, :float
    add_column :itineraries, :end_lat, :float
    add_column :itineraries, :end_lng, :float
  end
end
