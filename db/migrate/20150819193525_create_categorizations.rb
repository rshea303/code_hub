class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :resource, index: true, foreign_key: true
      t.references :keyword, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
