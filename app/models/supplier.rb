class Supplier < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :amenities
  has_many :packages

  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
