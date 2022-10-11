class AddFieldsToPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :package_type, :integer
    add_column :packages, :description, :text
    add_column :packages, :min_quantity, :integer
    add_column :packages, :max_quantity, :integer
    add_column :packages, :price_per_head, :decimal, precision: 8, scale: 2
  end
end
