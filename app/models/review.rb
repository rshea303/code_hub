class Review < ActiveRecord::Base
  belongs_to :resource
  belongs_to :user

  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :comment, length: { minimum: 4 }
end
