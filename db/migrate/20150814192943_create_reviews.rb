class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :comment
      t.integer :rating
      t.integer :resource_id

      t.timestamps null: false
    end
  end
end
