class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_one :score
  has_one_attached :avatar
  has_many :stations, dependent: :destroy
  has_many :reviews, through: :stations, dependent: :destroy
  after_create :create_score_record
  after_commit :default_avatar, on: %i[create]

  def login
    @login || self.username || self.email
  end

  def default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_user.jpg'
          )
        ),
        filename: 'default_user.jpg',
        content_type: 'image/jpg'
      )
    end
  end

  private

  def create_score_record
    create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 0)
  end

end
