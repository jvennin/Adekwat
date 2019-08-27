class CreateItineraryPois < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_pois do |t|
      t.references :itinerary, foreign_key: true
      t.references :poi, foreign_key: true

      t.timestamps
    end
  end
end
