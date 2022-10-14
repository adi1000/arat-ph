class CreateTouristDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :tourist_destinations do |t|
      t.references :tourist_spot
      t.references :package

      t.timestamps
    end
  end
end
