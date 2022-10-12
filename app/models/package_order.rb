class PackageOrder < ApplicationRecord
  belongs_to :package

  after_create_commit do
    if package.status != "active"
      package.update(status: "active")
    elsif package.min_quantity == package.total_purchase_orders
      package.update(status: "ready_for_trip")
    elsif package.max_quantity == package.total_purchase_orders
      package.update(status: "completed")
    end
  end

  def total_package_price
    purchase_quantity * package.price_per_head
  end
end
