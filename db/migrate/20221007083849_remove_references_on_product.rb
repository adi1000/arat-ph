class RemoveReferencesOnProduct < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:packages, :product, index: true)
  end
end
