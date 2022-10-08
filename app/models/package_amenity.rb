class PackageAmenity < ApplicationRecord
  belongs_to :package
  belongs_to :amenity
end
