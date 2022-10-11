class CreateProductPackages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_packages do |t|
      t.references :product
      t.references :package

      t.timestamps
    end
  end
end
