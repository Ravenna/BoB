class RemoveAwardIdFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :award_id
  end

  def down
    add_column :categories, :award_id, :integer
  end
end
