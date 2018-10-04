class User < ApplicationRecord
  has_many :bookings
  has_many :matched_users, through: :bookings
  has_many :listings
  has_many :reviews
  has_many :inquiries


  has_secure_password

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
