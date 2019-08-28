class AddConnectionToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :connection, :integer, default:2
  end
end
