class Package < ApplicationRecord
  belongs_to :supplier
  has_many :package_amenities
  has_many :amenities, through: :package_amenities

  has_one_attached :image

  accepts_nested_attributes_for :package_amenities
  accepts_nested_attributes_for :amenities
end
