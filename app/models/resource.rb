class Resource < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, :link, :description, :rating, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :description, length: { maximum: 200 }
  validates :link, uniqueness: { case_sensitive: false }

  def poor?
    self.rating < 3
  end

  def self.popular
    where("rating >= ?", 3).order(rating: :desc)
  end
end
