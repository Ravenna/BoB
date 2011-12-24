class ModifyAwards < ActiveRecord::Migration
  def up
   
    add_column :awards, :category_id, :integer
    remove_column :awards, :category
    rename_column :awards_categories, :award_category_id, :category_id
    rename_table :award_categories, :categories
  end

  def down
  end
end
