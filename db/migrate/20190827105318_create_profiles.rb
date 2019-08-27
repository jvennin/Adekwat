class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.boolean :lift
      t.boolean :escalator
      t.integer :walking_duration
      t.integer :stairs
      t.integer :score
      t.string :status

      t.timestamps
    end
  end
end
