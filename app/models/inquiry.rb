class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :content, presence: true

end
