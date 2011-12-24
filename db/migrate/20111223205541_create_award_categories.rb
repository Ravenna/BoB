class CreateAwardCategories < ActiveRecord::Migration
  def change
    create_table :award_categories do |t|
      t.string :name
      t.integer :award_id

      t.timestamps
    end
  end
end
