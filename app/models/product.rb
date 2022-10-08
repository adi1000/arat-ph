class Product < ApplicationRecord
  belongs_to :supplier

  has_one_attached :image

  has_rich_text :content

  enum product_type: [:bus, :van, :motorcycle, :pickup, :tricycle, :sedan, :suv, :wingvan]

  PRODUCT_TYPE = %w[bus van motorcycle pickup tricycle sedan suv wingvan]


  validates :name, presence: true
  validates :plate_number, presence: true
  validates :registration_date, presence: true
  validates :capacity, presence: true
end
