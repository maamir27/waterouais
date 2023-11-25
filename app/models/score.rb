class Score < ApplicationRecord
  belongs_to :user

  validates :check_in, :stations_created, :reviews_submitted, :photos_added, :total_score, numericality: { greater_than_or_equal_to: 0, allow_nil: false }

  def calculate_total_score
    total = check_in +
            stations_created +
            reviews_submitted +
            photos_added
    update(total_score: total)
  end
end
