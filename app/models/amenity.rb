class Amenity < ApplicationRecord
  belongs_to :supplier

  has_one_attached :image

  has_many :package_amenities
  has_many :packages, through: :package_amenities
end
