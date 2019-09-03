class AddNumberToPois < ActiveRecord::Migration[5.2]
  def change
    add_column :pois, :number, :integer
  end
end
