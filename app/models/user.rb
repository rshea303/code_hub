class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }, 
                    format: /\A\S+@\S+\z/
end
