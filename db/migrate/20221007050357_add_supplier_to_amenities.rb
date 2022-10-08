class AddSupplierToAmenities < ActiveRecord::Migration[7.0]
  def change
    add_reference :amenities, :supplier
  end
end
