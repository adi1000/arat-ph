class AddStatusToPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :status, :integer, null: false, default: 0
  end
end
