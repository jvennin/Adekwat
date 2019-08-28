class AddStartAddressToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :start_address, :string
  end
end
