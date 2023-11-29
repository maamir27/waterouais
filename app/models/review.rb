class Review < ApplicationRecord
  belongs_to :station
  belongs_to :user
  validates :rating, presence: true, numericality: { in: 0..5 }
  has_many_attached :photos
end
