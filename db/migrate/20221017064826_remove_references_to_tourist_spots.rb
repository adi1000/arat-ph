class RemoveReferencesToTouristSpots < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:tourist_spots, :package, index: true)
  end
end
