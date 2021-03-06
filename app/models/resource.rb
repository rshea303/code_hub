class Resource < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :categorizations, dependent: :destroy
  has_many :keywords, through: :categorizations

  validates :name, :link, :description, presence: true
  validates :description, length: { maximum: 200 }
  validates :link, uniqueness: { case_sensitive: false }

  def average_rating
    reviews.average(:rating)
  end
end
