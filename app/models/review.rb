class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :rating
  validates :description
end
