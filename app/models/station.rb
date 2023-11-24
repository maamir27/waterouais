class Station < ApplicationRecord
  has_many :reviews, dependent: :delete_all
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos
end
