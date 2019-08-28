class AddEndAddressToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :end_address, :string
  end
end
