class Keyword < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :resources, through: :categorizations
end
