class AddFieldsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :plate_number, :string
    add_column :products, :registration_date, :date
    add_column :products, :capacity, :integer
  end
end
