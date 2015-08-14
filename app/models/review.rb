class Review < ActiveRecord::Base
  belongs_to :resource

  validates :name, :comment, :rating, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :comment, length: { minimum: 4 }
end
