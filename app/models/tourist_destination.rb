class TouristDestination < ApplicationRecord
  belongs_to :tourist_spot
  belongs_to :package
end
