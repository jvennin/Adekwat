class AddOriginAndDestinationInItineraries < ActiveRecord::Migration[5.2]
  def change
    add_reference :itineraries, :origin, index: true, foreign_key: {to_table: :locations}
    add_reference :itineraries, :destination, index: true, foreign_key: {to_table: :locations}
  end
end
