class Keyword < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :resources, through: :categorizations

  scope :order_by_name, -> {order('LOWER(name)')}
end
