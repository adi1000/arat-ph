class AddSupplierToPackage < ActiveRecord::Migration[7.0]
  def change
    add_reference :packages, :supplier
  end
end
