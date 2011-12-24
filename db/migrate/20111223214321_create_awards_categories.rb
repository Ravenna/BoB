class CreateAwardsCategories < ActiveRecord::Migration
  def change
    create_table :awards_categories do |t|
      t.integer :award_id
      t.integer :award_category_id

      t.timestamps
    end
  end
end
