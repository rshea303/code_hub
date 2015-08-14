class RemoveRatingColumnFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :rating
  end
end
