class Resource < ActiveRecord::Base
  def poor?
    self.rating < 3
  end
end
