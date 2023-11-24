class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_one :score
  has_many :stations, dependent: :destroy
  has_many :reviews, through: :stations

  def calculate_total_score
    new_total_score = score.check_in +
    score.stations_created * 5 +
    score.reviews_submitted * 2 +
    score.photos_added * 2
  score.update(total_score: new_total_score)
end

  after_create :create_score_record
  private

  def create_score_record
    create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 0)
  end
end
