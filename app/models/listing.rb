class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings


  validates :name, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true

  mount_uploader :image, ImageUploader

end
