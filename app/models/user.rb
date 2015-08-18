class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_resources, through: :favorites, source: :resource

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, 
                    format: /\A\S+@\S+\z/
end
