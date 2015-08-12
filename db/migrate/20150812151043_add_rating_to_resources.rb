class AddRatingToResources < ActiveRecord::Migration
  def change
    add_column :resources, :rating, :decimal
  end
end
