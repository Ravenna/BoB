class AwardCleanup < ActiveRecord::Migration
  def up
    remove_column :awards, :category_id
  end

  def down
    add_column :awards, :category_id, :integer
  end
end