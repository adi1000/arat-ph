class CreateTouristSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :tourist_spots do |t|
      t.string :name
      t.text :description
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
