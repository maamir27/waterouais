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
  after_create :create_score_record

private

  def create_score_record
    create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 0)
  end
end
