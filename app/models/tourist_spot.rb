class TouristSpot < ApplicationRecord
  has_many :tourist_destinations
  has_many :packages, through: :tourist_destinations

  has_many_attached :images
end
