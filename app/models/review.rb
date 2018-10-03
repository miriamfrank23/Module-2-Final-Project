class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :rating, presence: true
  validates :description, presence: true
end
