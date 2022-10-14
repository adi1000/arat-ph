class Package < ApplicationRecord
  belongs_to :supplier
  has_many :package_orders
  has_many :package_amenities
  has_many :amenities, through: :package_amenities

  has_many :product_packages
  has_many :products, through: :product_packages

  has_many :tourist_destinations
  has_many :tourist_spots, through: :tourist_destinations

  has_one_attached :image

  accepts_nested_attributes_for :package_amenities
  accepts_nested_attributes_for :amenities

  validates :name, presence: true
  validates :description, length: { minimum: 50, maximum: 1000 }
  validates :min_quantity, numericality: { greater_than: 0 }
  validates :max_quantity, numericality: { greater_than: 0 }

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

  def total_purchase_orders
    orders = 0

    package_orders.each { |po| orders += po.purchase_quantity }

    orders
  end
end
