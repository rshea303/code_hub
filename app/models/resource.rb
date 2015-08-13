class Resource < ActiveRecord::Base
  def poor?
    self.rating < 3
  end

  def self.popular
    where("rating >= ?", 3).order(rating: :desc)
  end
end
