class CreatePois < ActiveRecord::Migration[5.2]
  def change
    create_table :pois do |t|
      t.float :lat
      t.float :lng
      t.string :address
      t.string :station_name
      t.boolean :lift
      t.boolean :escalator
      t.integer :stairs_number

      t.timestamps
    end
  end
end
