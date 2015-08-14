class Resource < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, :link, :description, presence: true
  validates :description, length: { maximum: 200 }
  validates :link, uniqueness: { case_sensitive: false }
end
