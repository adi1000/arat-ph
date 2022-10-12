class CreatePackageOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :package_orders do |t|
      t.integer :purchase_quantity
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
