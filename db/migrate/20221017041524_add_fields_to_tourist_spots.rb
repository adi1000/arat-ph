class AddFieldsToTouristSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :tourist_spots, :address, :string
    add_column :tourist_spots, :latitude, :decimal
    add_column :tourist_spots, :longitude, :decimal
  end
end
