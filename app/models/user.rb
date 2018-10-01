class User < ApplicationRecord
  has_many :bookings
  has_many :matched_users, through: :bookings
  has_many :listings
end
