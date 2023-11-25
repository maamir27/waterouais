class Review < ApplicationRecord
  belongs_to :station
  belongs_to :user
  validates :rating, presence: true
  has_many_attached :photos
end
