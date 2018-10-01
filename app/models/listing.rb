class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, uniqueness: true
end
