class Package < ApplicationRecord
  belongs_to :supplier
  has_many :package_amenities
  has_many :amenities, through: :package_amenities

  has_many :product_packages
  has_many :products, through: :product_packages

  has_one_attached :image

  accepts_nested_attributes_for :package_amenities
  accepts_nested_attributes_for :amenities

  enum package_type: %i[group_trip private_trip]

  PACKAGE_TYPE = %w[group_trip private_trip]

  enum status: %i[
         unpublished
         published
         active
         completed
         ready_for_trip
         canceled
       ]

  STATUS = %w[unpublished published active completed ready_for_trip canceled]

  def total_min_price
    min_quantity * price_per_head
  end

  def total_max_price
    max_quantity * price_per_head
  end
end
