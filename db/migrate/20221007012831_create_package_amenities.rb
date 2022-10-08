class CreatePackageAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :package_amenities do |t|
      t.references :package
      t.references :amenity

      t.timestamps
    end
  end
end
